// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDTO _$PostDTOFromJson(Map<String, dynamic> json) {
  return PostDTO(
    id: json['id'] as num,
    title: json['title'] as String,
    body: json['body'] as String,
    date: json['date'] as String,
    img: json['img'] as String,
    requiresLogin: json['requiresLogin'] as bool,
    isAd: json['isAd'] as bool,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$PostDTOToJson(PostDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
      'img': instance.img,
      'requiresLogin': instance.requiresLogin,
      'isAd': instance.isAd,
      'url': instance.url,
    };
