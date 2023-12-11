import 'dart:async';

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

  late DateTime nextPrayerTime;

  int indexNextPray = 0;
  bool isFajr = false;
  void calculateNextPrayerTime() {
    DateTime now = DateTime.now();

    for (var i = 0; i < playerTimeIcon.length; i++) {
      DateTime prayerTime = DateFormat('dd-MM-yyyy h:mm a').parse(
          '${prayerTimeList[dt.day - 1].date} ${prayerTimeList[dt.day - 1].prayers[i].time.toString()}');

      if (prayerTime.isAfter(now)) {
        nextPrayerTime = prayerTime;
        indexNextPray = i;
        emit(IndexNextPrayer(index: i));
        break;
      }
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
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();

      if (nextPrayerTime.isAfter(now)) {
        Duration timeDifference = nextPrayerTime.difference(now);
        emit(DifferenceDurationBetweenCurrentTimeAndPrayerTime(
            duration: timeDifference));
      }
    });
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
