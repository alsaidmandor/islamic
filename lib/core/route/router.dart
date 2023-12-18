import 'package:flutter/material.dart';
import 'package:islamic/features/nameOfAllah/presentation/pages/name_allah_screen.dart';
import 'package:islamic/features/prayertime/presentation/pages/calendar_screen.dart';
import 'package:islamic/features/prayertime/presentation/pages/qibla_screen.dart';
import 'package:islamic/features/prayertime/presentation/pages/tasbih_screen.dart';
import 'package:islamic/features/profile/presentation/pages/profile_screen.dart';

import '../../features/azkar/presentation/pages/askzr/azkar_screen.dart';
import '../../features/azkar/presentation/pages/askzr/reading_azkar-screen.dart';
import '../../features/dua/presentation/pages/daus_screen.dart';
import '../../features/mainLayer/presentation/pages/main_layout_screen.dart';
import '../../features/prayertime/presentation/pages/home.dart';
import '../../features/quran/presentation/pages/quran_screen.dart';
import '../../features/quran/presentation/pages/surah_screen.dart';

List<String> nameOfScreenDiscover = [
  Routes.azkar,
  Routes.tasbih,
  Routes.qibla,
  Routes.daus,
  Routes.nameOfAllah,
  Routes.calender,
];

class Routes {
  static const String mainLayoutHome = '/';
  static const String home = '/home';
  static const String quran = '/quran';
  static const String surah = '/surah';
  static const String juz = '/juz';
  static const String profile = '/profile';
  static const String azkar = '/azkar';
  static const String nameOfAllah = '/nameOfAllah';
  static const String tasbih = '/tasbih';
  static const String qibla = '/qibla';
  static const String daus = '/daus';
  static const String calender = '/calender';
  static const String readAzkar = '/readAzkar';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainLayoutHome:
        return MaterialPageRoute(
            builder: (context) => const MainLayoutScreen());
        break;
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomePrayerTime());
        break;
      case Routes.quran:
        return MaterialPageRoute(builder: (context) => const QuranScreen());
        break;
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routes.surah:
        return MaterialPageRoute(builder: (context) => const SurahScreen());
      case Routes.azkar:
        return MaterialPageRoute(builder: (context) => const AzkarScreen());
      case Routes.nameOfAllah:
        return MaterialPageRoute(
            builder: (context) => const NameOfAllahScreen());
      case Routes.tasbih:
        return MaterialPageRoute(builder: (context) => const TasbihScreen());
      case Routes.qibla:
        return MaterialPageRoute(builder: (context) => const QiblaScreen());
      case Routes.daus:
        return MaterialPageRoute(builder: (context) => DausScreen());
      case Routes.calender:
        return MaterialPageRoute(builder: (context) => const CalendarScreen());
      case Routes.readAzkar:
        return MaterialPageRoute(builder: (context) => ReadingAzkarScreen());

      // case Routes.juz:
      //   return MaterialPageRoute(builder: (context) =>  JuzScreen());
    }
    return null;
  }
}
