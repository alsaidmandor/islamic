import 'package:dartz/dartz.dart';
import 'package:islamic/core/error/failures.dart';
import 'package:islamic/core/use_case/no_params.dart';
import 'package:islamic/features/quran/data/models/sajda/sajda_list.dart';
import 'package:islamic/features/quran/domain/repositories/quran_repository_base.dart';

import '../../../../core/use_case/use_case_base.dart';

class GetSajdaUseCase extends UseCaseBase<SajdaList, NoParams> {
  final QuranRepositoryBase repositoryBase;

  GetSajdaUseCase({
    required this.repositoryBase,
  });

  @override
  Future<Either<Failure, SajdaList>> call(NoParams params) async {
    return await repositoryBase.getSajda();
  }
}
