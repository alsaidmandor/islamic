import 'package:hive_flutter/adapters.dart';
import 'package:islamic/features/prayertime/data/models/prayer_date.dart';

import '../../../features/prayertime/data/models/prayer.dart';
import '../../../features/quran/data/models/ayat/ayat.dart';
import '../../../features/quran/data/models/juzz/juz.dart';
import '../../../features/quran/data/models/juzz/juz_list.dart';
import '../../../features/quran/data/models/juzz/list_all_juz.dart';
import '../../../features/quran/data/models/sajda/sajda.dart';
import '../../../features/quran/data/models/sajda/sajda_list.dart';
import '../../../features/quran/data/models/surah/surah.dart';
import '../../../features/quran/data/models/surah/surah_list.dart';

class LocalDatabaseRegister {
  static initHive() async {
    await Hive.initFlutter();
  }

  static registerAdapter() {
    Hive.registerAdapter<Ayat>(AyatAdapter());
    Hive.registerAdapter<JuzList>(JuzListAdapter());
    Hive.registerAdapter<JuzAyahs>(JuzAyahsAdapter());
    Hive.registerAdapter<SajdaList>(SajdaListAdapter());
    Hive.registerAdapter<SajdaAyat>(SajdaAyatAdapter());
    Hive.registerAdapter<SurahsList>(SurahsListAdapter());
    Hive.registerAdapter<Surah>(SurahAdapter());
    Hive.registerAdapter<Prayer>(PrayerAdapter());
    Hive.registerAdapter<PrayerDate>(PrayerDateAdapter());
    Hive.registerAdapter<ListAllJuz>(ListAllJuzAdapter());
  }

  static openHiveBox() async {
    await Hive.openBox('quran');
    await Hive.openBox('juz');
    await Hive.openBox('prayerTime');
    // await Hive.openBox('location');
  }
}
