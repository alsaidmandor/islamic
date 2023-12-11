import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:islamic/features/prayertime/data/models/prayer.dart';

import '../../../../core/utils/constants.dart';

part 'prayer_date.g.dart';

@HiveType(typeId: 8)
class PrayerDate {
  PrayerDate(this.hijri, this.date, this.prayers);

  @HiveField(0)
  List<Prayer> prayers;
  @HiveField(1)
  String date;
  @HiveField(2)
  String hijri;

  factory PrayerDate.fromJson(Map<String, dynamic> json) {
    List<Prayer> prayers = [];
    (json["timings"] as Map<String, dynamic>).forEach((key, value) {
      if (key == 'Sunset') {
      } else {
        prayers.add(Prayer(convertTo12HourFormat(value), key, false));
      }
    });
    var dateGregorianModel = (json["date"] as Map<String, dynamic>)["gregorian"]
        as Map<String, dynamic>;
    var dateHijriModel =
        (json["date"] as Map<String, dynamic>)["hijri"] as Map<String, dynamic>;
    return PrayerDate(
        dateHijriModel['date'], dateGregorianModel["date"], prayers);
  }

  factory PrayerDate.fromJsonPrf(Map<String, dynamic> value) {
    List<Prayer> prayers = [];
    prayers.add(Prayer(value["time"], value["title"], value["selected"]));
    return PrayerDate(value['date'], value["date"], prayers);
  }

  Map<String, dynamic> toJson() => {
        'prayers':
            jsonEncode(prayers, toEncodable: (e) => (e as Prayer).toJson()),
        'date': date,
      };
}
