// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayertime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerTimeAdapter extends TypeAdapter<PrayerTime> {
  @override
  final int typeId = 7;

  @override
  PrayerTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerTime(
      code: fields[0] as int?,
      status: fields[1] as String?,
      data: (fields[2] as List?)?.cast<Data>(),
    );
  }

  @override
  void write(BinaryWriter writer, PrayerTime obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 8;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      timings: fields[0] as Timings?,
      date: fields[1] as Date?,
      meta: fields[2] as Meta?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timings)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimingsAdapter extends TypeAdapter<Timings> {
  @override
  final int typeId = 8;

  @override
  Timings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timings(
      Fajr: fields[0] as String?,
      Sunrise: fields[1] as String?,
      Dhuhr: fields[2] as String?,
      Asr: fields[3] as String?,
      Maghrib: fields[4] as String?,
      Isha: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Timings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.Fajr)
      ..writeByte(1)
      ..write(obj.Sunrise)
      ..writeByte(2)
      ..write(obj.Dhuhr)
      ..writeByte(3)
      ..write(obj.Asr)
      ..writeByte(4)
      ..write(obj.Maghrib)
      ..writeByte(5)
      ..write(obj.Isha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DateAdapter extends TypeAdapter<Date> {
  @override
  final int typeId = 9;

  @override
  Date read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Date(
      readable: fields[0] as String?,
      timestamp: fields[1] as String?,
      gregorian: fields[2] as Gregorian?,
      hijri: fields[3] as Hijri?,
    );
  }

  @override
  void write(BinaryWriter writer, Date obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.readable)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.gregorian)
      ..writeByte(3)
      ..write(obj.hijri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GregorianAdapter extends TypeAdapter<Gregorian> {
  @override
  final int typeId = 10;

  @override
  Gregorian read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Gregorian(
      date: fields[0] as String?,
      format: fields[1] as String?,
      day: fields[2] as String?,
      weekday: fields[3] as Weekday?,
      month: fields[4] as Month?,
      year: fields[5] as String?,
      designation: fields[6] as Designation?,
    );
  }

  @override
  void write(BinaryWriter writer, Gregorian obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.weekday)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.designation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GregorianAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeekdayAdapter extends TypeAdapter<Weekday> {
  @override
  final int typeId = 11;

  @override
  Weekday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weekday(
      en: fields[0] as String?,
      ar: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weekday obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.en)
      ..writeByte(1)
      ..write(obj.ar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MonthAdapter extends TypeAdapter<Month> {
  @override
  final int typeId = 12;

  @override
  Month read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Month(
      number: fields[0] as int?,
      en: fields[1] as String?,
      ar: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Month obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.ar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DesignationAdapter extends TypeAdapter<Designation> {
  @override
  final int typeId = 13;

  @override
  Designation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Designation(
      abbreviated: fields[0] as String?,
      expanded: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Designation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.abbreviated)
      ..writeByte(1)
      ..write(obj.expanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DesignationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HijriAdapter extends TypeAdapter<Hijri> {
  @override
  final int typeId = 14;

  @override
  Hijri read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hijri(
      date: fields[0] as String?,
      format: fields[1] as String?,
      day: fields[2] as String?,
      weekday: fields[3] as Weekday?,
      month: fields[4] as Month?,
      year: fields[5] as String?,
      designation: fields[6] as Designation?,
      holidays: (fields[7] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Hijri obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.weekday)
      ..writeByte(4)
      ..write(obj.month)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.designation)
      ..writeByte(7)
      ..write(obj.holidays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HijriAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 15;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
      timezone: fields[2] as String?,
      method: fields[3] as Method?,
      latitudeAdjustmentMethod: fields[4] as String?,
      midnightMode: fields[5] as String?,
      school: fields[6] as String?,
      offset: fields[7] as Offset?,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.method)
      ..writeByte(4)
      ..write(obj.latitudeAdjustmentMethod)
      ..writeByte(5)
      ..write(obj.midnightMode)
      ..writeByte(6)
      ..write(obj.school)
      ..writeByte(7)
      ..write(obj.offset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MethodAdapter extends TypeAdapter<Method> {
  @override
  final int typeId = 16;

  @override
  Method read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Method(
      id: fields[0] as int?,
      name: fields[1] as String?,
      params: fields[2] as Params?,
      location: fields[3] as Location?,
    );
  }

  @override
  void write(BinaryWriter writer, Method obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.params)
      ..writeByte(3)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParamsAdapter extends TypeAdapter<Params> {
  @override
  final int typeId = 17;

  @override
  Params read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Params(
      Fajr: fields[0] as double?,
      Isha: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Params obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.Fajr)
      ..writeByte(1)
      ..write(obj.Isha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 18;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      latitude: fields[0] as double?,
      longitude: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTime _$PrayerTimeFromJson(Map<String, dynamic> json) => PrayerTime(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrayerTimeToJson(PrayerTime instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      timings: json['timings'] == null
          ? null
          : Timings.fromJson(json['timings'] as Map<String, dynamic>),
      date: json['date'] == null
          ? null
          : Date.fromJson(json['date'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'timings': instance.timings,
      'date': instance.date,
      'meta': instance.meta,
    };

Timings _$TimingsFromJson(Map<String, dynamic> json) => Timings(
      Fajr: json['Fajr'] as String?,
      Sunrise: json['Sunrise'] as String?,
      Dhuhr: json['Dhuhr'] as String?,
      Asr: json['Asr'] as String?,
      Maghrib: json['Maghrib'] as String?,
      Isha: json['Isha'] as String?,
    );

Map<String, dynamic> _$TimingsToJson(Timings instance) => <String, dynamic>{
      'Fajr': instance.Fajr,
      'Sunrise': instance.Sunrise,
      'Dhuhr': instance.Dhuhr,
      'Asr': instance.Asr,
      'Maghrib': instance.Maghrib,
      'Isha': instance.Isha,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      readable: json['readable'] as String?,
      timestamp: json['timestamp'] as String?,
      gregorian: json['gregorian'] == null
          ? null
          : Gregorian.fromJson(json['gregorian'] as Map<String, dynamic>),
      hijri: json['hijri'] == null
          ? null
          : Hijri.fromJson(json['hijri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'readable': instance.readable,
      'timestamp': instance.timestamp,
      'gregorian': instance.gregorian,
      'hijri': instance.hijri,
    };

Gregorian _$GregorianFromJson(Map<String, dynamic> json) => Gregorian(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day'] as String?,
      weekday: json['weekday'] == null
          ? null
          : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
      month: json['month'] == null
          ? null
          : Month.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String?,
      designation: json['designation'] == null
          ? null
          : Designation.fromJson(json['designation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GregorianToJson(Gregorian instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
    };

Weekday _$WeekdayFromJson(Map<String, dynamic> json) => Weekday(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$WeekdayToJson(Weekday instance) => <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

Month _$MonthFromJson(Map<String, dynamic> json) => Month(
      number: json['number'] as int?,
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$MonthToJson(Month instance) => <String, dynamic>{
      'number': instance.number,
      'en': instance.en,
      'ar': instance.ar,
    };

Designation _$DesignationFromJson(Map<String, dynamic> json) => Designation(
      abbreviated: json['abbreviated'] as String?,
      expanded: json['expanded'] as String?,
    );

Map<String, dynamic> _$DesignationToJson(Designation instance) =>
    <String, dynamic>{
      'abbreviated': instance.abbreviated,
      'expanded': instance.expanded,
    };

Hijri _$HijriFromJson(Map<String, dynamic> json) => Hijri(
      date: json['date'] as String?,
      format: json['format'] as String?,
      day: json['day'] as String?,
      weekday: json['weekday'] == null
          ? null
          : Weekday.fromJson(json['weekday'] as Map<String, dynamic>),
      month: json['month'] == null
          ? null
          : Month.fromJson(json['month'] as Map<String, dynamic>),
      year: json['year'] as String?,
      designation: json['designation'] == null
          ? null
          : Designation.fromJson(json['designation'] as Map<String, dynamic>),
      holidays: json['holidays'] as List<dynamic>?,
    );

Map<String, dynamic> _$HijriToJson(Hijri instance) => <String, dynamic>{
      'date': instance.date,
      'format': instance.format,
      'day': instance.day,
      'weekday': instance.weekday,
      'month': instance.month,
      'year': instance.year,
      'designation': instance.designation,
      'holidays': instance.holidays,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      method: json['method'] == null
          ? null
          : Method.fromJson(json['method'] as Map<String, dynamic>),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod'] as String?,
      midnightMode: json['midnightMode'] as String?,
      school: json['school'] as String?,
      offset: json['offset'] == null
          ? null
          : Offset.fromJson(json['offset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timezone': instance.timezone,
      'method': instance.method,
      'latitudeAdjustmentMethod': instance.latitudeAdjustmentMethod,
      'midnightMode': instance.midnightMode,
      'school': instance.school,
      'offset': instance.offset,
    };

Method _$MethodFromJson(Map<String, dynamic> json) => Method(
      id: json['id'] as int?,
      name: json['name'] as String?,
      params: json['params'] == null
          ? null
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MethodToJson(Method instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'params': instance.params,
      'location': instance.location,
    };

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      Fajr: (json['Fajr'] as num?)?.toDouble(),
      Isha: (json['Isha'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'Fajr': instance.Fajr,
      'Isha': instance.Isha,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Offset _$OffsetFromJson(Map<String, dynamic> json) => Offset(
      Imsak: json['Imsak'] as int?,
      Fajr: json['Fajr'] as int?,
      Sunrise: json['Sunrise'] as int?,
      Dhuhr: json['Dhuhr'] as int?,
      Asr: json['Asr'] as int?,
      Maghrib: json['Maghrib'] as int?,
      Sunset: json['Sunset'] as int?,
      Isha: json['Isha'] as int?,
      Midnight: json['Midnight'] as int?,
    );

Map<String, dynamic> _$OffsetToJson(Offset instance) => <String, dynamic>{
      'Imsak': instance.Imsak,
      'Fajr': instance.Fajr,
      'Sunrise': instance.Sunrise,
      'Dhuhr': instance.Dhuhr,
      'Asr': instance.Asr,
      'Maghrib': instance.Maghrib,
      'Sunset': instance.Sunset,
      'Isha': instance.Isha,
      'Midnight': instance.Midnight,
    };
