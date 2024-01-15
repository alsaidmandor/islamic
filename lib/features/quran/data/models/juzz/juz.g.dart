// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JuzAyahsAdapter extends TypeAdapter<JuzAyahs> {
  @override
  final int typeId = 2;

  @override
  JuzAyahs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JuzAyahs(
      englishName: fields[9] as String?,
      revelationType: fields[10] as String?,
      numberOfAyahs: fields[11] as int?,
      numberOfAyahInQuran: fields[12] as int?,
      numberInSurah: fields[3] as int?,
      juz: fields[4] as int?,
      manzil: fields[5] as int?,
      page: fields[6] as int?,
      ruka: fields[7] as int?,
      hizbQuarter: fields[8] as int?,
      ayahsText: fields[0] as String?,
      surahName: fields[2] as String?,
      ayahNumber: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, JuzAyahs obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.ayahsText)
      ..writeByte(1)
      ..write(obj.ayahNumber)
      ..writeByte(2)
      ..write(obj.surahName)
      ..writeByte(3)
      ..write(obj.numberInSurah)
      ..writeByte(4)
      ..write(obj.juz)
      ..writeByte(5)
      ..write(obj.manzil)
      ..writeByte(6)
      ..write(obj.page)
      ..writeByte(7)
      ..write(obj.ruka)
      ..writeByte(8)
      ..write(obj.hizbQuarter)
      ..writeByte(9)
      ..write(obj.englishName)
      ..writeByte(10)
      ..write(obj.revelationType)
      ..writeByte(11)
      ..write(obj.numberOfAyahs)
      ..writeByte(12)
      ..write(obj.numberOfAyahInQuran);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JuzAyahsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
