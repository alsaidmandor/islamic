import 'dart:convert';

En enFromJson(String str) => En.fromJson(json.decode(str));
String enToJson(En data) => json.encode(data.toJson());

class En {
  En({
    this.meaning,
  });

  En.fromJson(dynamic json) {
    meaning = json['meaning'];
  }
  String? meaning;
  En copyWith({
    String? meaning,
  }) =>
      En(
        meaning: meaning ?? this.meaning,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meaning'] = meaning;
    return map;
  }
}
