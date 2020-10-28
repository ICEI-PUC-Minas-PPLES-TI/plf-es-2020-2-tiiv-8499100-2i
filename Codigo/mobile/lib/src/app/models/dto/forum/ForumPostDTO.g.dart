// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForumPostDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumPostDTO _$ForumPostDTOFromJson(Map<String, dynamic> json) {
  return ForumPostDTO(
    id: json['id'] as num,
    body: json['body'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    user: json['user'] as String,
    isOriginalPost: json['isOriginalPost'] as bool,
  );
}

Map<String, dynamic> _$ForumPostDTOToJson(ForumPostDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'date': instance.date?.toIso8601String(),
      'user': instance.user,
      'isOriginalPost': instance.isOriginalPost,
    };
