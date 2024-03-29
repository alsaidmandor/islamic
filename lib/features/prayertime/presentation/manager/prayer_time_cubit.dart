import 'dart:async';

import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:islamic/core/error/failures.dart';
import 'package:islamic/core/services/local/cache_helper.dart';
import 'package:islamic/core/utils/app_strings.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/utils/constants.dart';
import '../../data/models/prayer_date.dart';
import '../../domain/entitiy/params_get_prayer_time.dart';
import '../../domain/use_cases/get_prayertime_use_case.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  final GetPrayerTimeUseCase getPrayerTimeUseCase;
  PrayerTimeCubit({required this.getPrayerTimeUseCase})
      : super(PrayerTimeLoading());

  static PrayerTimeCubit get(context) => BlocProvider.of(context);

  List<PrayerDate> prayerTimeList = [];

  void getPrayerTime(ParamsGetPrayerTime params) async {
    emit(PrayerTimeLoading());
    final prayerTime = await getPrayerTimeUseCase.call(params);
    prayerTime.fold((failure) {
      emit(PrayerTimeFailure(message: _mapFailureToMessage(failure)));
    }, (time) {
      print(time?.length);
      print(time![1].prayers.length);
      prayerTimeList = time!;
      emit(PrayerTimeLoaded(prayerTime: time));
    });
    calculateNextPrayerTime();
  }

  int currentPrayerTimePageIndex = dt.day - 1;

  void changePrayerTimePageIndex(int value) {
    currentPrayerTimePageIndex = value;
    emit(ChangePageIndexInPrayerTime());
  }

  void incrementPrayerTimePageIndex() {
    if (currentPrayerTimePageIndex < prayerTimeList.length + 1) {
      currentPrayerTimePageIndex += 1;
    }
  }

  void decrementPrayerTimePageIndex() {
    if (currentPrayerTimePageIndex != 0) {
      currentPrayerTimePageIndex -= 1;
      emit(ChangePageIndexInPrayerTime());
    }
  }

  DateTime? nextPrayerTime;

  int indexNextPray = 0;
  bool isFajr = false;
  void calculateNextPrayerTime() {
    DateTime now = DateTime.now();

    for (var i = 0; i < playerTimeIcon.length; i++) {
      DateTime prayerTime = DateFormat('dd-MM-yyyy h:mm a').parse(
          '${prayerTimeList[dt.day - 1].date} ${prayerTimeList[dt.day - 1].prayers[i].time.toString()}');

      if (prayerTime.isAfter(now)) {
        nextPrayerTime = prayerTime;
        nextPrayer = prayerTime;
        // Background.nextPrayerr = prayerTime;
        indexNextPray = i;
        emit(IndexNextPrayer(index: i));
        print(nextPrayer!.day);
        print('nextPrayer!.day');
        break;
      }
      startTimer();
      var isha = DateFormat('dd-MM-yyyy h:mm a').parse(
          '${prayerTimeList[dt.day - 1].date} ${prayerTimeList[dt.day - 1].prayers[5].time.toString()}');
      if (prayerTime.isAtSameMomentAs(isha) || isha.isBefore(now)) {
        nextPrayerTime = DateFormat('dd-MM-yyyy h:mm a').parse(
            '${prayerTimeList[dt.day].date} ${prayerTimeList[dt.day].prayers[0].time.toString()}');
        isFajr = true;
      } else {
        isFajr = false;
      }
    }
  }

  Timer? timer;
  Duration? timeDifference;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      if (nextPrayerTime != null) {
        timeDifference = nextPrayerTime!.difference(now);
        emit(DifferenceDurationBetweenCurrentTimeAndPrayerTime(
            duration: timeDifference!));
        print(
            '${timeDifference!.inHours * 60 * 60 + timeDifference!.inMinutes * 60 + timeDifference!.inSeconds}');

        /*     if (nextPrayerTime!.isAtSameMomentAs(now)) {
          calculateNextPrayerTime();
          emit(NextPrayer());
          print('hhhhhhhhhhhhhhhh');
        }*/

        if (timeDifference!.inHours == 0 &&
            timeDifference!.inMinutes == 0 &&
            timeDifference!.inSeconds == 0) {
          calculateNextPrayerTime();
          emit(NextPrayer());

          print('hhhhhhhhhhhhhhhh');
        }
      }
    });
  }

  void cancelTime() {
    timer!.cancel();
    emit(CancelTimer());
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getUserCountryAndCity() async {
    if (await handleLocationPermission()) {
      emit(LocationLoading());
      if (await NetworkInfoImpl(connectionChecker: InternetConnectionChecker())
          .isConnected) {
        final Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        await placemarkFromCoordinates(position.latitude, position.longitude)
            .then((List<Placemark> placeMarks) {
          Placemark place = placeMarks[0];
          print(
              '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}');
          CacheHelper.saveData(
              key: 'cityName', value: place.subAdministrativeArea.toString());
          CacheHelper.saveData(
              key: 'countryName', value: place.country.toString());
          countryCode = place.isoCountryCode.toString();
          emit(LocationLoaded(placemark: place));
        }).catchError((e) {
          emit(LocationFailure());
          debugPrint(e);
        });
      } else {
        emit(LocationLoaded(placemark: Placemark()));
      }

      // loggerNoStack.d('$country -----------  $city');
      // return '$country, $city';
    } else {
      // return null; // Permission not granted
      // logger.e('Permission not granted');
    }
  }

/*
  Color getBackgroundColor() {
    emit(ChangeSliderIndex());
    return ThemeMode.system == ThemeMode.dark
        ? ColorsManager.backgroundScreenDark
        : ColorsManager.backgroundScreenLight;
  }
*/

  List<City> cityAll = [];
  Future<void> city(String countryCode) async {
    cityAll.clear();
    if (cityAll.isEmpty) {
      await getCountryCities(countryCode)
          .then((value) => cityAll.addAll(value));
      print(cityAll[0].name);
      print(cityAll.length);
    }
  }

  List<Country> listOfCountry = [];

  void getCountry() async {
    await getAllCountries().then((value) => listOfCountry.addAll(value));
  }

  List<City> searchCity = [];
  void getSearchCity(String name) {
    searchCity = cityAll
        .where((city) => city.name
            .toLowerCase()
            .trim()
            .startsWith(name.toLowerCase().trim()))
        .toList();
    emit(Search());
  }

  String country = 'Egypt';
  String countryCode = 'Eg';
  void selectedCountry(String name, String code) {
    country = name;
    countryCode = code;
    city(code);
    emit(SelectedCountryAndCode());
  }

  String cityName = 'Cairo';
  void selectedCity(String name) {
    cityName = name;
    CacheHelper.saveData(key: 'cityName', value: name);
    CacheHelper.saveData(key: 'countryName', value: country);
    emit(SelectedCity());
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return AppStrings.SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return AppStrings.CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexcepted error';
  }
}
