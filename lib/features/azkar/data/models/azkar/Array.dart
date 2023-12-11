import 'dart:convert';

Array arrayFromJson(String str) => Array.fromJson(json.decode(str));
String arrayToJson(Array data) => json.encode(data.toJson());
class Array {
  Array({
      this.id, 
      this.text, 
      this.count, 
      this.audio, 
      this.filename,});

  Array.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
    count = json['count'];
    audio = json['audio'];
    filename = json['filename'];
  }
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;
Array copyWith({  int? id,
  String? text,
  int? count,
  String? audio,
  String? filename,
}) => Array(  id: id ?? this.id,
  text: text ?? this.text,
  count: count ?? this.count,
  audio: audio ?? this.audio,
  filename: filename ?? this.filename,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    map['count'] = count;
    map['audio'] = audio;
    map['filename'] = filename;
    return map;
  }

}