import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:islamic/core/error/exceptions.dart';
import 'package:islamic/core/error/failures.dart';
import 'package:islamic/core/services/local/local_service.dart';
import 'package:islamic/features/prayertime/data/data_sources/prayertime_remote_data_source.dart';
import 'package:islamic/features/prayertime/data/models/prayer_date.dart';
import 'package:islamic/features/prayertime/domain/repositories/prayertime_repository_base.dart';

import '../../../../core/network/network_info.dart';

class PrayerTimeRepository extends PrayerTimeRepositoryBase {
  final LocalService local;

  PrayerTimeRepository(super.remote, super.networkInfo, {required this.local});

  @override
  Future<Either<Failure, List<PrayerDate>?>> getPrayerTime(
      {required String year,
      required String month,
      required String city,
      required String country}) async {
    if (await networkInfo.isConnected) {
      try {
        local.delete();
        List<PrayerDate>? remotePrayerTime = await remote.getPrayerTime(
            year: year, month: month, city: city, country: country);
        local.save(remotePrayerTime);

        return Right(remotePrayerTime);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<dynamic>? localPrayerTime = await local.getData();
        return Right(localPrayerTime!.cast<PrayerDate>());
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  NetworkInfo get networkInfo =>
      NetworkInfoImpl(connectionChecker: InternetConnectionChecker());

  @override
  PrayerTimeRemoteDataSourceBase get remote => PrayerTimeRemoteDataSource();
}
