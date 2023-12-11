import 'dart:convert';

import 'En.dart';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.name,
    this.transliteration,
    this.number,
    this.en,
  });

  Data.fromJson(dynamic json) {
    name = json['name'];
    transliteration = json['transliteration'];
    number = json['number'];
    en = json['en'] != null ? En.fromJson(json['en']) : null;
  }
  String? name;
  String? transliteration;
  int? number;
  En? en;
  Data copyWith({
    String? name,
    String? transliteration,
    int? number,
    En? en,
  }) =>
      Data(
        name: name ?? this.name,
        transliteration: transliteration ?? this.transliteration,
        number: number ?? this.number,
        en: en ?? this.en,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['transliteration'] = transliteration;
    map['number'] = number;
    if (en != null) {
      map['en'] = en?.toJson();
    }
    return map;
  }
}
