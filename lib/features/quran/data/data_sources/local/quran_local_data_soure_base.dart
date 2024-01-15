import 'package:islamic/features/quran/data/models/surah/surah_list.dart';

import '../../models/juzz/juz_list.dart';
import '../../models/juzz/list_all_juz.dart';

abstract class QuranLocalDataSourceBase {
  void saveSurahList(SurahsList save);
  Future<SurahsList> getSurahList();

  void saveJuzList(JuzList save , int index);
  JuzList getJuzList(int index);
  Future<void> delete(String key);
  Future<bool> checkIfHasData(String key);
}
