import 'Dua.dart';
import 'dart:convert';

ListDua listDuaFromJson(String str) => ListDua.fromJson(json.decode(str));
String listDuaToJson(ListDua data) => json.encode(data.toJson());
class ListDua {
  ListDua({
      this.dua,});

  ListDua.fromJson(dynamic json) {
    if (json['Dua'] != null) {
      dua = [];
      json['Dua'].forEach((v) {
        dua?.add(Dua.fromJson(v));
      });
    }
  }
  List<Dua>? dua;
ListDua copyWith({  List<Dua>? dua,
}) => ListDua(  dua: dua ?? this.dua,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dua != null) {
      map['Dua'] = dua?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}