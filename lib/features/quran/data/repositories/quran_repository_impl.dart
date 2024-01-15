import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:islamic/core/error/failures.dart';
import 'package:islamic/core/network/network_info.dart';
import 'package:islamic/core/services/dio_service.dart';
import 'package:islamic/features/quran/data/data_sources/remote/quran_remote_data_source.dart';
import 'package:islamic/features/quran/data/models/juzz/juz_list.dart';
import 'package:islamic/features/quran/data/models/sajda/sajda_list.dart';
import 'package:islamic/features/quran/data/models/surah/surah_list.dart';
import 'package:islamic/features/quran/domain/repositories/quran_repository_base.dart';

import '../../../../core/error/exceptions.dart';
import '../data_sources/local/quran_local_data_soure_base.dart';

class QuranRepositoryImpl extends QuranRepositoryBase {
  final QuranLocalDataSourceBase local;
  QuranRepositoryImpl(
      {required this.local, required super.networkInfo, required super.remote});

  @override
  Future<Either<Failure, JuzList>> getJuz({required int index}) async {
    if (await networkInfo.isConnected) {
      try {
        // local.delete('juz');

        final remoteGetJuz = await remote.getRemoteJuz(index: index);

        local.saveJuzList(remoteGetJuz, index);
        print('Save  local ${remoteGetJuz.juzAyahs![index].hizbQuarter}');
        return Right(remoteGetJuz);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        JuzList juzList = await local.getJuzList(index);

        return Right(juzList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, SajdaList>> getSajda() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteGetSajda = await remote.getRemoteSajda();
        return Right(remoteGetSajda);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final remoteGetSajda = await remote.getRemoteSajda();
        return Right(remoteGetSajda);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, SurahsList>> getSurahList() async {
    if (await networkInfo.isConnected) {
      try {
        /*SurahsList localSurah = await local.getSurahList();

        if (localSurah.surahs!.isNotEmpty) {
          return Right(localSurah);
        } else {
          final SurahsList remoteGetSurah = await remote.getRemoteSurahList();
          local.saveSurahList(remoteGetSurah);
          return Right(remoteGetSurah);
        }*/

        final SurahsList remoteGetSurah = await remote.getRemoteSurahList();
        local.saveSurahList(remoteGetSurah);
        return Right(remoteGetSurah);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        SurahsList localSurah = await local.getSurahList();
        return Right(localSurah);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  NetworkInfo get networkInfo =>
      NetworkInfoImpl(connectionChecker: InternetConnectionChecker());

  @override
  QuranRemoteDataSourceBase get remote =>
      QuranRemoteDataSourceImpl(dioService: DioService());
}
