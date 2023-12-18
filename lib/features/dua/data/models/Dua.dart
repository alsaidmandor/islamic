import 'dart:convert';

Dua duaFromJson(String str) => Dua.fromJson(json.decode(str));
String duaToJson(Dua data) => json.encode(data.toJson());

class Dua {
  Dua({
    this.title,
    this.arabic,
    this.transliteration,
    this.translation,
    this.reference,
  });

  Dua.fromJson(dynamic json) {
    title = json['title'];
    arabic = json['arabic'];
    transliteration = json['transliteration'];
    translation = json['translation'];
    reference = json['reference'];
  }
  String? title;
  String? arabic;
  String? transliteration;
  String? translation;
  String? reference;
  Dua copyWith({
    String? name,
    String? title,
    String? arabic,
    String? transliteration,
    String? translation,
    String? reference,
  }) =>
      Dua(
        title: title ?? this.title,
        arabic: arabic ?? this.arabic,
        transliteration: transliteration ?? this.transliteration,
        translation: translation ?? this.translation,
        reference: reference ?? this.reference,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['arabic'] = arabic;
    map['transliteration'] = transliteration;
    map['translation'] = translation;
    map['reference'] = reference;
    return map;
  }
}
