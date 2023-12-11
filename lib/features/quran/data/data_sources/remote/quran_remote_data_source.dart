import 'package:dio/dio.dart';

import '../../../../../core/services/dio_service.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../models/juzz/juz_list.dart';
import '../../models/sajda/sajda_list.dart';
import '../../models/surah/surah_list.dart';

abstract class QuranRemoteDataSourceBase {
  Future<SurahsList> getRemoteSurahList();
  Future<SajdaList> getRemoteSajda();
  Future<JuzList> getRemoteJuz({required int index});
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSourceBase {
  final DioService dioService;

  QuranRemoteDataSourceImpl({required this.dioService});

  @override
  Future<JuzList> getRemoteJuz({required int index}) async {
    Response response =
        await dioService.dio.get('juz/$index ${AppStrings.juzEndPoint}');
    if (response.statusCode == 200) {
      JuzList juzList = JuzList.fromJSON(response.data);
      return juzList;
    } else {
      throw Exception("Failed  to Load Juz");
    }
  }

  @override
  Future<SajdaList> getRemoteSajda() async {
    Response response = await dioService.dio.get(AppStrings.sajdaEndPoint);

    if (response.statusCode == 200) {
      SajdaList sajdaList = SajdaList.fromJSON(response.data);
      return sajdaList;
    } else {
      throw Exception("Failed  to Load Sajda");
    }
  }

  @override
  Future<SurahsList> getRemoteSurahList() async {
    try {
      Response response = await dioService.dio.get(AppStrings.quranEndPoint);
      if (response.statusCode == 200) {
        SurahsList surahsList = SurahsList.fromJSON(response.data);
        return surahsList;
      } else {
        throw Exception("Failed  to Load List Of Surah");
      }
    } catch (e) {
      throw Exception('Failed to fetch Quran == ${e.toString()}');
    }
  }
}
