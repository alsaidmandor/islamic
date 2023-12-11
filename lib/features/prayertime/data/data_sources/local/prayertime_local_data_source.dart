import 'package:hive/hive.dart';
import 'package:islamic/core/services/local/local_service.dart';

class PrayerTimeLocalDataSource implements LocalService<List<dynamic>> {
  final String prayerTimeListBox = 'prayerTime';

  // Future<Box<List<PrayerDate>>> get _box async =>
  //     await Hive.openBox<List<PrayerDate>>(prayerTimeListBox);
  final _box = Hive.box('prayerTime');

  @override
  Future<void> save(List<dynamic> save) async {
    var box = await _box;
    box.put('time', save);
  }

  @override
  Future<void> delete() async {
    var box = await _box;
    box.delete('time');
  }

  @override
  Future<List<dynamic>?> getData() async {
    var box = await _box;
    return box.get('time');
  }
}
