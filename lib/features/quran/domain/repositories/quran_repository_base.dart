import 'package:dartz/dartz.dart';
import 'package:islamic/features/quran/data/data_sources/remote/quran_remote_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../data/models/juzz/juz_list.dart';
import '../../data/models/sajda/sajda_list.dart';
import '../../data/models/surah/surah_list.dart';

abstract class QuranRepositoryBase {
  final NetworkInfo networkInfo;
  final QuranRemoteDataSourceBase remote;

  const QuranRepositoryBase({
    required this.networkInfo,
    required this.remote,
  });

  Future<Either<Failure, SurahsList>> getSurahList();
  Future<Either<Failure, SajdaList>> getSajda();
  Future<Either<Failure, JuzList>> getJuz({required int index});
}
