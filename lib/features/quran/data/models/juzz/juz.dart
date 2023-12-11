import 'package:hive/hive.dart';

part 'juz.g.dart';

@HiveType(typeId: 2)
class JuzAyahs {
  @HiveField(0)
  final String? ayahsText;
  @HiveField(1)
  final int? ayahNumber;
  @HiveField(2)
  final String? surahName;

  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruka;
  final int? hizbQuarter;
  // final bool? sajda;

  final String? englishName;
  final String? revelationType;
  final int? numberOfAyahs;
  final int? numberOfAyahInQuran;
  JuzAyahs(
      {this.englishName,
      this.revelationType,
      this.numberOfAyahs,
      this.numberOfAyahInQuran,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruka,
      this.hizbQuarter,
      // this.sajda,
      this.ayahsText,
      this.surahName,
      this.ayahNumber});

  factory JuzAyahs.fromJSON(Map<String, dynamic> json) {
    return JuzAyahs(
      ayahNumber: json['number'],
      ayahsText: json['text'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruka: json['ruka'],
      hizbQuarter: json['hizbQuarter'],
      // sajda: json['sajda'],
      surahName: json['surah']['name'],
      numberOfAyahInQuran: json['surah']['number'],
      numberOfAyahs: json['surah']['numberOfAyahs'],
      englishName: json['surah']['englishName'],
      revelationType: json['surah']['revelationType'],
    );
  }
}
