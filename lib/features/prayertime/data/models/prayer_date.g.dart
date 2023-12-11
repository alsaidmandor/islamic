// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerDateAdapter extends TypeAdapter<PrayerDate> {
  @override
  final int typeId = 8;

  @override
  PrayerDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerDate(
      fields[2] as String,
      fields[1] as String,
      (fields[0] as List).cast<Prayer>(),
    );
  }

  @override
  void write(BinaryWriter writer, PrayerDate obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.prayers)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.hijri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
