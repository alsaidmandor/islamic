import 'Data.dart';
import 'dart:convert';

ListAzkar listAzkarFromJson(String str) => ListAzkar.fromJson(json.decode(str));
String listAzkarToJson(ListAzkar data) => json.encode(data.toJson());
class ListAzkar {
  ListAzkar({
      this.data,});

  ListAzkar.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
ListAzkar copyWith({  List<Data>? data,
}) => ListAzkar(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}