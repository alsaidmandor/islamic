import 'package:dartz/dartz.dart';
import 'package:islamic/features/prayertime/data/data_sources/prayertime_remote_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../data/models/prayer_date.dart';

abstract class PrayerTimeRepositoryBase {
  final PrayerTimeRemoteDataSourceBase remote;
  final NetworkInfo networkInfo;

  PrayerTimeRepositoryBase(this.remote, this.networkInfo);

  Future<Either<Failure, List<PrayerDate>?>> getPrayerTime(
      {required String year,
      required String month,
      required String city,
      required String country});
}
