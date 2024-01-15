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
  @HiveField(3)
  final int? numberInSurah;
  @HiveField(4)
  final int? juz;
  @HiveField(5)
  final int? manzil;
  @HiveField(6)
  final int? page;
  @HiveField(7)
  final int? ruka;
  @HiveField(8)
  final int? hizbQuarter;

  // final bool? sajda;
  @HiveField(9)
  final String? englishName;
  @HiveField(10)
  final String? revelationType;
  @HiveField(11)
  final int? numberOfAyahs;
  @HiveField(12)
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
