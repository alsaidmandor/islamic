import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:islamic/core/network/network_info.dart';
import 'package:islamic/core/services/dio_service.dart';
import 'package:islamic/core/utils/app_strings.dart';
import 'package:islamic/features/mainLayer/presentation/Cubit/app_cubit.dart';
import 'package:islamic/features/nameOfAllah/presentation/manager/name_of_allah_cubit.dart';
import 'package:islamic/features/prayertime/data/data_sources/local/prayertime_local_data_source.dart';
import 'package:islamic/features/prayertime/data/data_sources/prayertime_remote_data_source.dart';
import 'package:islamic/features/prayertime/data/repositories/prayertime_repository.dart';
import 'package:islamic/features/prayertime/domain/use_cases/get_prayertime_use_case.dart';
import 'package:islamic/features/prayertime/presentation/manager/prayer_time_cubit.dart';
import 'package:islamic/features/quran/data/data_sources/local/quran_local_data_source.dart';
import 'package:islamic/features/quran/data/data_sources/remote/quran_remote_data_source.dart';
import 'package:islamic/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:islamic/features/quran/domain/use_cases/get_juz_use_case.dart';
import 'package:islamic/features/quran/domain/use_cases/get_sajda_use_case.dart';
import 'package:islamic/features/quran/domain/use_cases/get_surah_use_case.dart';

import 'core/color/color_schemes.g.dart';
import 'core/route/router.dart';
import 'features/azkar/presentation/manager/azkar_cubit.dart';
import 'features/quran/presentation/manager/quran_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => AppCubit()),
        BlocProvider<PrayerTimeCubit>(
            create: (context) => PrayerTimeCubit(
                    getPrayerTimeUseCase:
                        GetPrayerTimeUseCase(PrayerTimeRepository(
                  PrayerTimeRemoteDataSource(),
                  NetworkInfoImpl(
                      connectionChecker: InternetConnectionChecker()),
                  local: PrayerTimeLocalDataSource(),
                )))),
        BlocProvider<QuranCubit>(
            create: (context) => QuranCubit(
                juzUseCase: GetJuzUseCase(
                  repositoryBase: QuranRepositoryImpl(
                    local: QuranLocalDataSource(),
                    networkInfo: NetworkInfoImpl(
                        connectionChecker: InternetConnectionChecker()),
                    remote: QuranRemoteDataSourceImpl(
                      dioService: DioService(),
                    ),
                  ),
                ),
                sajdaUseCase: GetSajdaUseCase(
                    repositoryBase: QuranRepositoryImpl(
                  local: QuranLocalDataSource(),
                  networkInfo: NetworkInfoImpl(
                      connectionChecker: InternetConnectionChecker()),
                  remote: QuranRemoteDataSourceImpl(
                    dioService: DioService(),
                  ),
                )),
                surahUseCase: GetSurahUseCase(
                    repositoryBase: QuranRepositoryImpl(
                  local: QuranLocalDataSource(),
                  networkInfo: NetworkInfoImpl(
                      connectionChecker: InternetConnectionChecker()),
                  remote: QuranRemoteDataSourceImpl(
                    dioService: DioService(),
                  ),
                )))
              ..getSurahs()
              ..getAllJuz()),
        BlocProvider<AzkarCubit>(
          create: (context) => AzkarCubit()..getAzkar(),
        ),
        BlocProvider<NameOfAllahCubit>(
          create: (context) => NameOfAllahCubit()..get99NameOfAlah(),
        )
      ],
      child: MaterialApp(
        title: 'Islamic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
            fontFamily: AppStrings.fontFamily),
        themeMode: ThemeMode.system,
        initialRoute: Routes.mainLayoutHome,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
