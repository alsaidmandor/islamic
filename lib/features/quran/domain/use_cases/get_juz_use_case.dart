import 'package:dartz/dartz.dart';
import 'package:islamic/core/error/failures.dart';
import 'package:islamic/features/quran/data/models/juzz/juz_list.dart';
import 'package:islamic/features/quran/domain/repositories/quran_repository_base.dart';

import '../../../../core/use_case/use_case_base.dart';
import '../entities/params_get_juz.dart';

class GetJuzUseCase extends UseCaseBase<JuzList, ParamsGetJuz> {
  final QuranRepositoryBase repositoryBase;

  GetJuzUseCase({
    required this.repositoryBase,
  });

  @override
  Future<Either<Failure, JuzList>> call(ParamsGetJuz params) async {
    return await repositoryBase.getJuz(index: params.index);
  }
}
