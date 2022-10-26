// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doujin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoujinAdapter extends TypeAdapter<Doujin> {
  @override
  final int typeId = 0;

  @override
  Doujin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Doujin(
      code: fields[0] as String,
      tag: fields[1] as String,
      page: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Doujin obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.tag)
      ..writeByte(2)
      ..write(obj.page);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoujinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
