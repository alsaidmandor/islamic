import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:islamic/features/prayertime/data/data_sources/local/prayertime_local_data_source.dart';

import '../models/prayer_date.dart';

abstract class PrayerTimeRemoteDataSourceBase {
  Future<List<PrayerDate>> getPrayerTime(
      {required String year,
      required String month,
      required String city,
      required String country});
}

class PrayerTimeRemoteDataSource extends PrayerTimeRemoteDataSourceBase {
  PrayerTimeLocalDataSource prayerTimeLocalDataSource =
      PrayerTimeLocalDataSource();
  @override
  Future<List<PrayerDate>> getPrayerTime(
      {required String year,
      required String month,
      required String city,
      required String country}) async {
    List<PrayerDate> allPrayersForMonth = [];

    String url =
        "https://api.aladhan.com/v1/calendarByCity/$year/$month?city=$city&country=$country&method=5";

    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(json.decode(response.body));
      }

      allPrayersForMonth.addAll(fromJson(jsonDecode(response.body)));
      return allPrayersForMonth;
    } else {
      throw Exception("Failed  to Load Time");
    }
  }

  List<PrayerDate> fromJson(Map<String, dynamic> json) {
    var prayers = json["data"] as List<dynamic>;
    return prayers
        .map((e) => PrayerDate.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
