import 'package:hive/hive.dart';
import 'package:islamic/features/quran/data/data_sources/local/quran_local_data_soure_base.dart';
import 'package:islamic/features/quran/data/models/surah/surah_list.dart';

import '../../models/juzz/juz_list.dart';

class QuranLocalDataSourceImpl implements QuranLocalDataSourceBase {
  final _box = Hive.box('quran');
  final _boxJuz = Hive.box('juz');

  @override
  // Future<void> save(SurahsList save) async {
  //   var box = await _box;
  //   box.put('quran', save);
  // }
  //
  // @override
  // Future<void> delete(String key) async {
  //   var box = await _box;
  //   box.delete('quran');
  // }

  // @override
  // Future<SurahsList?> getData() async {
  //   var box = await _box;
  //   return box.get('quran');
  // }

  @override
  JuzList getJuzList(int index) {
    Box box = _boxJuz;
    return box.get('juz$index');
  }

  @override
  Future<SurahsList> getSurahList() async {
    var box = await _box;
    return box.get('quran');
  }

  @override
  Future<void> saveJuzList(JuzList save, int index) async {
    var box = await _boxJuz;
    box.put('juz$index', save);
  }

  @override
  Future<void> saveSurahList(SurahsList save) async {
    var box = await _box;
    box.put('quran', save);
  }

  @override
  Future<void> delete(String key) async {
    var box = await _box;
    box.delete(key);
  }

  @override
  Future<bool> checkIfHasData(String key) async {
    var box = await _box;
    var isTrue = box.containsKey(key);
    return isTrue;
  }
}
