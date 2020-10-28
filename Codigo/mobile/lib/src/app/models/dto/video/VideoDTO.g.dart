// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDTO _$VideoDTOFromJson(Map<String, dynamic> json) {
  return VideoDTO(
    id: json['id'] as num,
    title: json['title'] as String,
    youtubeUrl: json['youtubeUrl'] as String,
    isAd: json['isAd'] as bool,
    url: json['url'] as String,
    img: json['img'] as String,
  );
}

Map<String, dynamic> _$VideoDTOToJson(VideoDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'youtubeUrl': instance.youtubeUrl,
      'isAd': instance.isAd,
      'url': instance.url,
      'img': instance.img,
    };
