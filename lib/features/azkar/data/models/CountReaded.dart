import 'dart:convert';

CountReaded countReadedFromJson(String str) => CountReaded.fromJson(json.decode(str));
String countReadedToJson(CountReaded data) => json.encode(data.toJson());
class CountReaded {
  CountReaded({
      this.indexPage, 
      this.count,});

  CountReaded.fromJson(dynamic json) {
    indexPage = json['indexPage'];
    count = json['count'];
  }
  int? indexPage;
  int? count;
CountReaded copyWith({  int? indexPage,
  int? count,
}) => CountReaded(  indexPage: indexPage ?? this.indexPage,
  count: count ?? this.count,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['indexPage'] = indexPage;
    map['count'] = count;
    return map;
  }

}