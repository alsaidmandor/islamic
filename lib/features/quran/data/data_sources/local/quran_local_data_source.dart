import 'package:hive/hive.dart';
import 'package:islamic/core/services/local/local_service.dart';
import 'package:islamic/features/quran/data/models/surah/surah_list.dart';

class QuranLocalDataSource implements LocalService<SurahsList> {
  final _box = Hive.box('quran');

  @override
  Future<void> save(SurahsList save) async {
    var box = await _box;
    box.put('quran', save);
  }

  @override
  Future<void> delete() async {
    var box = await _box;
    box.delete('quran');
  }

  @override
  Future<SurahsList?> getData() async {
    var box = await _box;
    return box.get('quran');
  }
}
