import 'package:flutter/material.dart';

import '../color/colors.dart';
import 'assets_manager.dart';

var dt = DateTime.now();

double rotationAngle = 0.0;

String city = '';
String country = '';

DateTime? nextPrayer;

String countryCode = 'EG';
Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Color getListColorBackground(BuildContext context, int index) {
  Brightness brightness = Theme.of(context).brightness;

  return brightness == Brightness.dark
      ? colorBackgroundSurahDark[index]
      : colorBackgroundSurahLight[index];
}

Color getListColorBorderForSelected(BuildContext context, int index) {
  Brightness brightness = Theme.of(context).brightness;

  return brightness == Brightness.dark
      ? colorBorderDark[index]
      : colorBorderLight[index];
}

List<ImageProvider> backgroundDua = [
  AppImages.dau1,
  AppImages.dau2,
  AppImages.dau3,
  AppImages.dau4,
];

List<ImageProvider> playerTimeIcon = [
  AppImages.iconfajr,
  AppImages.iconsunrise,
  AppImages.icondhuhr,
  AppImages.iconAsr,
  AppImages.icondmaghrip,
  AppImages.iconisha,
];

List<ImageProvider> islamicIcon = [
  AppIslamicIcon.quran3,
  AppIslamicIcon.tasbih,
  AppIslamicIcon.clock,
  AppIslamicIcon.mail,
  AppIslamicIcon.allah,
  AppIslamicIcon.calendar,
];

List<Color> playerTimeIconColor = [
  ColorsManager.mainColor,
  ColorsManager.greenboldColor,
  ColorsManager.greenLightColor,
  ColorsManager.blueLightColor,
  ColorsManager.blueLight2Color,
  ColorsManager.blueColor,
];

List<String> prayerName = [
  "Fajr",
  "Sunrise",
  "Dhuhr",
  "Asr",
  "Maghrib",
  "Isha",
];

List<String> discoverName = [
  "Azkar",
  "Tasbih",
  "Qibla",
  "Daus",
  "99 Names",
  "Calendar",
];

Widget SpaceLine(
    {required BuildContext context,
    required double height,
    double horizontalPadding = 0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: Container(
      height: height,
      color: Theme.of(context).colorScheme.outline.withOpacity(0.25),
    ),
  );
}

String convertTo12HourFormat(String time) {
  String times = time.substring(0, 6);
  int hour = int.parse(times.split(':')[0]);
  int minute = int.parse(times.split(':')[1]);
  String period = 'AM';

  if (hour >= 12) {
    period = 'PM';
    if (hour > 12) {
      hour -= 12;
    }
  }
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
}
