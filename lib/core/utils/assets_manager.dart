import 'package:flutter/material.dart';

// const String imgPath = 'assets/images/';
//
// class ImgAssets {
//   static String background = '${imgPath}background.png';
//   static String mosque = '${imgPath}mosque.png';
//   static String mosqueHomeBackground = '${imgPath}mosquehome.png';
// }

const String _imagePath = 'assets/images';
const String _islamicIconPath = 'assets/images/iconislamic';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class _IslamicIcon extends AssetImage {
  const _IslamicIcon(String fileName) : super('$_islamicIconPath/$fileName');
}

class AppImages {
  static const background = _Image('background.png');
  static const mosque = _Image('mosque.png');
  static const mosque2 = _Image('mosque2.png');
  static const mosqueHomeBackground = _Image('mosquehome.png');
  static const starterSurah = _Image('bismi.png');
  static const quranArText = _Image('quran.png');
  static const iconAsr = _Image('asricon.png');
  static const icondhuhr = _Image('dhuhricon.png');
  static const icondmaghrip = _Image('maghripicon.png');
  static const iconisha = _Image('ishaicon.png');
  static const iconfajr = _Image('fajricon.png');
  static const iconsunrise = _Image('sunriseicon.png');
  static const backgroundMap = _Image('backgroundmap.jpeg');
  static const mapIcon = _Image('map.png');
  static const dau1 = _Image('dua1.jpg');
  static const dau2 = _Image('dua2.jpg');
  static const dau3 = _Image('dua3.jpg');
  static const dau4 = _Image('dua4.jpg');
}

class AppIslamicIcon {
  static const home = _IslamicIcon('home.png');
  static const home2 = _IslamicIcon('home2.png');
  static const allah = _IslamicIcon('allah.png');
  static const allah2 = _IslamicIcon('allah2.png');
  static const calendar = _IslamicIcon('calendar.png');
  static const clock = _IslamicIcon('clock.png');
  static const dome = _IslamicIcon('dome.png');
  static const mail = _IslamicIcon('mail.png');
  static const mosqueHome = _IslamicIcon('mosquehome.png');
  static const quran2 = _IslamicIcon('quran2.png');
  static const quran3 = _IslamicIcon('quran3.png');
  static const tasbih = _IslamicIcon('tasbih.png');
  static const ahyaNumber = _IslamicIcon('ayahnumber.png');
  static const backgroundBotton = _IslamicIcon('patterbotton.png');
  static const log = _IslamicIcon('logo.png');
  static const star = _IslamicIcon('star.png');
  static const openBook = _IslamicIcon('openbook.png');
  static const flowar = _IslamicIcon('flowar.png');
  static const nameBorder = _IslamicIcon('titlename.png');
}
