import 'CountReaded.dart';
import 'dart:convert';

AzkarReaded azkarReadedFromJson(String str) => AzkarReaded.fromJson(json.decode(str));
String azkarReadedToJson(AzkarReaded data) => json.encode(data.toJson());
class AzkarReaded {
  AzkarReaded({
      this.indexListOfAzkar, 
      this.countReaded,});

  AzkarReaded.fromJson(dynamic json) {
    indexListOfAzkar = json['indexListOfAzkar'];
    if (json['CountReaded'] != null) {
      countReaded = [];
      json['CountReaded'].forEach((v) {
        countReaded?.add(CountReaded.fromJson(v));
      });
    }
  }
  int? indexListOfAzkar;
  List<CountReaded>? countReaded;
AzkarReaded copyWith({  int? indexListOfAzkar,
  List<CountReaded>? countReaded,
}) => AzkarReaded(  indexListOfAzkar: indexListOfAzkar ?? this.indexListOfAzkar,
  countReaded: countReaded ?? this.countReaded,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['indexListOfAzkar'] = indexListOfAzkar;
    if (countReaded != null) {
      map['CountReaded'] = countReaded?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}