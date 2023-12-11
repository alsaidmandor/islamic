import 'package:dartz/dartz.dart';
import 'package:islamic/core/use_case/use_case_base.dart';
import 'package:islamic/features/prayertime/domain/entitiy/params_get_prayer_time.dart';
import 'package:islamic/features/prayertime/domain/repositories/prayertime_repository_base.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/prayer_date.dart';

class GetPrayerTimeUseCase
    extends UseCaseBase<List<PrayerDate>?, ParamsGetPrayerTime> {
  final PrayerTimeRepositoryBase repository;

  GetPrayerTimeUseCase(this.repository);

  @override
  Future<Either<Failure, List<PrayerDate>?>> call(
      ParamsGetPrayerTime params) async {
    return await repository.getPrayerTime(
        year: params.year,
        month: params.month,
        city: params.city,
        country: params.country);
  }
}
