// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AttachmentDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentDTO _$AttachmentDTOFromJson(Map<String, dynamic> json) {
  return AttachmentDTO(
    json['url'],
    json['data'],
    json['type'],
  );
}

Map<String, dynamic> _$AttachmentDTOToJson(AttachmentDTO instance) =>
    <String, dynamic>{
      'url': instance.url,
      'data': instance.data,
      'type': _$AttachmentTypeEnumMap[instance.type],
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.DONE: 'DONE',
  AttachmentType.PENDING: 'PENDING',
  AttachmentType.ERROR: 'ERROR',
};
