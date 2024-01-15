// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_all_juz.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListAllJuzAdapter extends TypeAdapter<ListAllJuz> {
  @override
  final int typeId = 9;

  @override
  ListAllJuz read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListAllJuz(
      juzList: (fields[0] as List?)?.cast<JuzList>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListAllJuz obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.juzList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListAllJuzAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
