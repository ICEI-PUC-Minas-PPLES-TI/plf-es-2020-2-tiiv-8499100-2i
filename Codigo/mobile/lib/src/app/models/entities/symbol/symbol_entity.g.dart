// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SymbolEntityAdapter extends TypeAdapter<SymbolEntity> {
  @override
  final int typeId = 1;

  @override
  SymbolEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SymbolEntity()
      ..id = fields[0] as String
      ..title = fields[1] as String
      ..body = fields[2] as String
      ..img = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, SymbolEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SymbolEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
