// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoEntityAdapter extends TypeAdapter<VideoEntity> {
  @override
  final int typeId = 4;

  @override
  VideoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoEntity()
      ..id = fields[0] as String
      ..title = fields[1] as String
      ..youtubeUrl = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, VideoEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.youtubeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
