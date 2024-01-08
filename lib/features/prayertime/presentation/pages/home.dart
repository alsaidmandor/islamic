import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:islamic/core/network/network_info.dart';
import 'package:islamic/features/prayertime/domain/entitiy/params_get_prayer_time.dart';

import '../../../../core/location/location.dart';
import '../../../../core/services/local/cache_helper.dart';
import '../../../../core/utils/constants.dart';
import '../manager/prayer_time_cubit.dart';
import '../widgets/build_bottom_sheet.dart';
import '../widgets/build_top-body_home_screen.dart';

class HomePrayerTime extends StatefulWidget {
  const HomePrayerTime({super.key});

  @override
  State<HomePrayerTime> createState() => _HomePrayerTimeState();
}

class _HomePrayerTimeState extends State<HomePrayerTime> {
  @override
  void initState() {
    context.read<PrayerTimeCubit>().getUserCountryAndCity();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PrayerTimeCubit, PrayerTimeState>(
      listener: (context, state) async {
        if (state is LocationLoaded) {
          String city = CacheHelper.getData(key: 'cityName');
          String country = CacheHelper.getData(key: 'countryName');

          if (await NetworkInfoImpl(
                  connectionChecker: InternetConnectionChecker())
              .isConnected) {
            print('Is Conected');
            context.read<PrayerTimeCubit>().getPrayerTime(ParamsGetPrayerTime(
                  year: dt.year.toString(),
                  month: dt.month.toString(),
                  city: state.placemark.subAdministrativeArea.toString(),
                  country: state.placemark.country.toString(),
                ));
          } else {
            print('Is not  Conected');

            context.read<PrayerTimeCubit>().getPrayerTime(ParamsGetPrayerTime(
                  year: dt.year.toString(),
                  month: dt.month.toString(),
                  city: city,
                  country: country,
                ));
          }
          currentAddress = state.placemark.subAdministrativeArea ?? city;
          print(
              'Hive Box Loccation ${CacheHelper.getData(key: 'cityName')} - ${CacheHelper.getData(key: 'countryName')}');
          print(
              '${dt.year.toString()} , ${dt.month.toString()} , ${state.placemark.subAdministrativeArea.toString()},${state.placemark.country.toString()}');
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Stack(
            children: [
              BuildTopBodyHomeScreen(),
              BuildBottomSheet(),
            ],
          ),
        );
      },
    );
  }
}
