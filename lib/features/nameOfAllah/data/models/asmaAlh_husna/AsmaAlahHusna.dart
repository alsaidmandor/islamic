import 'dart:convert';

import 'Data.dart';

AsmaAlahHusna asmaAlahHusnaFromJson(String str) =>
    AsmaAlahHusna.fromJson(json.decode(str));
String asmaAlahHusnaToJson(AsmaAlahHusna data) => json.encode(data.toJson());

class AsmaAlahHusna {
  AsmaAlahHusna({
    this.code,
    this.status,
    this.data,
  });

  AsmaAlahHusna.nonParam();

  AsmaAlahHusna.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? code;
  String? status;
  List<Data>? data;
  AsmaAlahHusna copyWith({
    int? code,
    String? status,
    List<Data>? data,
  }) =>
      AsmaAlahHusna(
        code: code ?? this.code,
        status: status ?? this.status,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
