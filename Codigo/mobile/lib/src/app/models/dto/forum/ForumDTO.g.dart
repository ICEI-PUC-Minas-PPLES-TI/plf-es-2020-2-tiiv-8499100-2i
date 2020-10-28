// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForumDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumDTO _$ForumDTOFromJson(Map<String, dynamic> json) {
  return ForumDTO(
    id: json['id'] as num,
    title: json['title'] as String,
    originalPost: json['originalPost'] == null
        ? null
        : ForumPostDTO.fromJson(json['originalPost'] as Map<String, dynamic>),
    forumPosts: (json['forumPosts'] as List)
        ?.map((e) =>
            e == null ? null : ForumPostDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForumDTOToJson(ForumDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalPost': instance.originalPost,
      'forumPosts': instance.forumPosts,
    };
