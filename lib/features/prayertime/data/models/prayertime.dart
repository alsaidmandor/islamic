import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayertime.g.dart';

@JsonSerializable()
@HiveType(typeId: 7)
class PrayerTime {
  @HiveField(0)
  final int? code;
  @HiveField(1)
  final String? status;
  @HiveField(2)
  final List<Data>? data;

  const PrayerTime({
    this.code,
    this.status,
    this.data,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimeFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimeToJson(this);

  PrayerTime copyWith({
    int? code,
    String? status,
    List<Data>? data,
  }) {
    return PrayerTime(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 8)
class Data {
  @HiveField(0)
  final Timings? timings;
  @HiveField(1)
  final Date? date;
  @HiveField(2)
  final Meta? meta;

  const Data({
    this.timings,
    this.date,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) {
    return Data(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      meta: meta ?? this.meta,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 8)
class Timings {
  @HiveField(0)
  final String? Fajr;
  @HiveField(1)
  final String? Sunrise;
  @HiveField(2)
  final String? Dhuhr;
  @HiveField(3)
  final String? Asr;
  @HiveField(4)
  final String? Maghrib;
  @HiveField(5)
  final String? Isha;

  const Timings({
    this.Fajr,
    this.Sunrise,
    this.Dhuhr,
    this.Asr,
    this.Maghrib,
    this.Isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) =>
      _$TimingsFromJson(json);

  Map<String, dynamic> toJson() => _$TimingsToJson(this);

  Timings copyWith({
    String? Fajr,
    String? Sunrise,
    String? Dhuhr,
    String? Asr,
    String? Maghrib,
    String? Isha,
  }) {
    return Timings(
      Fajr: Fajr ?? this.Fajr,
      Sunrise: Sunrise ?? this.Sunrise,
      Dhuhr: Dhuhr ?? this.Dhuhr,
      Asr: Asr ?? this.Asr,
      Maghrib: Maghrib ?? this.Maghrib,
      Isha: Isha ?? this.Isha,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 9)
class Date {
  @HiveField(0)
  final String? readable;
  @HiveField(1)
  final String? timestamp;
  @HiveField(2)
  final Gregorian? gregorian;
  @HiveField(3)
  final Hijri? hijri;

  const Date({
    this.readable,
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);

  Date copyWith({
    String? readable,
    String? timestamp,
    Gregorian? gregorian,
    Hijri? hijri,
  }) {
    return Date(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      gregorian: gregorian ?? this.gregorian,
      hijri: hijri ?? this.hijri,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 10)
class Gregorian {
  @HiveField(0)
  final String? date;
  @HiveField(1)
  final String? format;
  @HiveField(2)
  final String? day;
  @HiveField(3)
  final Weekday? weekday;
  @HiveField(4)
  final Month? month;
  @HiveField(5)
  final String? year;
  @HiveField(6)
  final Designation? designation;

  const Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) =>
      _$GregorianFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianToJson(this);

  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
  }) {
    return Gregorian(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 11)
class Weekday {
  @HiveField(0)
  final String? en;
  @HiveField(1)
  final String? ar;

  const Weekday({
    this.en,
    this.ar,
  });

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      _$WeekdayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekdayToJson(this);

  Weekday copyWith({
    String? en,
    String? ar,
  }) {
    return Weekday(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 12)
class Month {
  @HiveField(0)
  final int? number;
  @HiveField(1)
  final String? en;
  @HiveField(2)
  final String? ar;

  const Month({
    this.number,
    this.en,
    this.ar,
  });

  factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

  Map<String, dynamic> toJson() => _$MonthToJson(this);

  Month copyWith({
    int? number,
    String? en,
    String? ar,
  }) {
    return Month(
      number: number ?? this.number,
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 13)
class Designation {
  @HiveField(0)
  final String? abbreviated;
  @HiveField(1)
  final String? expanded;

  const Designation({
    this.abbreviated,
    this.expanded,
  });

  factory Designation.fromJson(Map<String, dynamic> json) =>
      _$DesignationFromJson(json);

  Map<String, dynamic> toJson() => _$DesignationToJson(this);

  Designation copyWith({
    String? abbreviated,
    String? expanded,
  }) {
    return Designation(
      abbreviated: abbreviated ?? this.abbreviated,
      expanded: expanded ?? this.expanded,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 14)
class Hijri {
  @HiveField(0)
  final String? date;
  @HiveField(1)
  final String? format;
  @HiveField(2)
  final String? day;
  @HiveField(3)
  final Weekday? weekday;
  @HiveField(4)
  final Month? month;
  @HiveField(5)
  final String? year;
  @HiveField(6)
  final Designation? designation;
  @HiveField(7)
  final List<dynamic>? holidays;

  const Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

  Map<String, dynamic> toJson() => _$HijriToJson(this);

  Hijri copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
    List<dynamic>? holidays,
  }) {
    return Hijri(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
      holidays: holidays ?? this.holidays,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 15)
class Meta {
  @HiveField(0)
  final double? latitude;
  @HiveField(1)
  final double? longitude;
  @HiveField(2)
  final String? timezone;
  @HiveField(3)
  final Method? method;
  @HiveField(4)
  final String? latitudeAdjustmentMethod;
  @HiveField(5)
  final String? midnightMode;
  @HiveField(6)
  final String? school;
  @HiveField(7)
  final Offset? offset;

  const Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  Meta copyWith({
    double? latitude,
    double? longitude,
    String? timezone,
    Method? method,
    String? latitudeAdjustmentMethod,
    String? midnightMode,
    String? school,
    Offset? offset,
  }) {
    return Meta(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      method: method ?? this.method,
      latitudeAdjustmentMethod:
          latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
      midnightMode: midnightMode ?? this.midnightMode,
      school: school ?? this.school,
      offset: offset ?? this.offset,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 16)
class Method {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final Params? params;
  @HiveField(3)
  final Location? location;

  const Method({
    this.id,
    this.name,
    this.params,
    this.location,
  });

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);

  Method copyWith({
    int? id,
    String? name,
    Params? params,
    Location? location,
  }) {
    return Method(
      id: id ?? this.id,
      name: name ?? this.name,
      params: params ?? this.params,
      location: location ?? this.location,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 17)
class Params {
  @HiveField(0)
  final double? Fajr;
  @HiveField(1)
  final double? Isha;

  const Params({
    this.Fajr,
    this.Isha,
  });

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);

  Params copyWith({
    double? Fajr,
    double? Isha,
  }) {
    return Params(
      Fajr: Fajr ?? this.Fajr,
      Isha: Isha ?? this.Isha,
    );
  }
}

@JsonSerializable()
@HiveType(typeId: 18)
class Location {
  @HiveField(0)
  final double? latitude;
  @HiveField(1)
  final double? longitude;

  const Location({
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  Location copyWith({
    double? latitude,
    double? longitude,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}

@JsonSerializable()
class Offset {
  @HiveField(0)
  final int? Imsak;
  @HiveField(1)
  final int? Fajr;
  @HiveField(2)
  final int? Sunrise;
  @HiveField(3)
  final int? Dhuhr;
  @HiveField(4)
  final int? Asr;
  @HiveField(5)
  final int? Maghrib;
  @HiveField(6)
  final int? Sunset;
  @HiveField(7)
  final int? Isha;
  @HiveField(8)
  final int? Midnight;

  const Offset({
    this.Imsak,
    this.Fajr,
    this.Sunrise,
    this.Dhuhr,
    this.Asr,
    this.Maghrib,
    this.Sunset,
    this.Isha,
    this.Midnight,
  });

  factory Offset.fromJson(Map<String, dynamic> json) => _$OffsetFromJson(json);

  Map<String, dynamic> toJson() => _$OffsetToJson(this);

  Offset copyWith({
    int? Imsak,
    int? Fajr,
    int? Sunrise,
    int? Dhuhr,
    int? Asr,
    int? Maghrib,
    int? Sunset,
    int? Isha,
    int? Midnight,
  }) {
    return Offset(
      Imsak: Imsak ?? this.Imsak,
      Fajr: Fajr ?? this.Fajr,
      Sunrise: Sunrise ?? this.Sunrise,
      Dhuhr: Dhuhr ?? this.Dhuhr,
      Asr: Asr ?? this.Asr,
      Maghrib: Maghrib ?? this.Maghrib,
      Sunset: Sunset ?? this.Sunset,
      Isha: Isha ?? this.Isha,
      Midnight: Midnight ?? this.Midnight,
    );
  }
}
