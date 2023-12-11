import 'dart:convert';

import 'package:hive/hive.dart';

part 'ayat.g.dart';

@HiveType(typeId: 0)
class Ayat {
  @HiveField(0)
  final String? text;

  @HiveField(1)
  final int? number;
  @HiveField(2)
  final int? numberInSurah;

  @HiveField(3)
  final int? juz;

  @HiveField(4)
  final int? manzil;
  @HiveField(5)
  final int? page;
  @HiveField(6)
  final int? ruku;
  @HiveField(7)
  final int? hizbQuarter;


  Ayat({
    this.text,
    this.number,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
  });

  factory Ayat.fromJSON(Map<String, dynamic> json) {
    return Ayat(
      text: json['text'],
      number: json['number'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],
    );
  }

  Ayat copyWith({
    String? text,
    int? number,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
  }) {
    return Ayat(
      text: text ?? this.text,
      number: number ?? this.number,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
    );
  }

  Ayat merge(Ayat model) {
    return Ayat(
      text: model.text ?? text,
      number: model.number ?? number,
      numberInSurah: model.numberInSurah ?? numberInSurah,
      juz: model.juz ?? juz,
      manzil: model.manzil ?? manzil,
      page: model.page ?? page,
      ruku: model.ruku ?? ruku,
      hizbQuarter: model.hizbQuarter ?? hizbQuarter,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'number': number,
      'numberInSurah': numberInSurah,
      'juz':  juz,
      'manzil':  manzil,
      'page':  page,
      'ruku':  ruku,
      'hizbQuarter':  hizbQuarter,
    };
  }

  String toJson() => json.encode(toMap());

  factory Ayat.fromMap(Map<String, dynamic> map) {
    return Ayat(
      text: map['text'],
      number: map['number'],
      numberInSurah:  map['numberInSurah'],
      juz:  map['juz'],
      manzil: map ['manzil'],
      page:  map['page'],
      ruku:  map['ruku'],
      hizbQuarter:  map['hizbQuarter'],
    );
  }

  factory Ayat.fromJson(String source) => Ayat.fromMap(json.decode(source));

  @override
  String toString() => 'Ayat(text: $text, number: $number)';
}
