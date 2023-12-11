import 'Array.dart';
import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.category, 
      this.audio, 
      this.filename, 
      this.array,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    audio = json['audio'];
    filename = json['filename'];
    if (json['array'] != null) {
      array = [];
      json['array'].forEach((v) {
        array?.add(Array.fromJson(v));
      });
    }
  }
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<Array>? array;
Data copyWith({  int? id,
  String? category,
  String? audio,
  String? filename,
  List<Array>? array,
}) => Data(  id: id ?? this.id,
  category: category ?? this.category,
  audio: audio ?? this.audio,
  filename: filename ?? this.filename,
  array: array ?? this.array,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['audio'] = audio;
    map['filename'] = filename;
    if (array != null) {
      map['array'] = array?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}