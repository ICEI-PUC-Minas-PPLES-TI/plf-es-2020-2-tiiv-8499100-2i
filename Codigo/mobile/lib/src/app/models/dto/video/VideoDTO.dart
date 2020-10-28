import 'package:json_annotation/json_annotation.dart';

part 'VideoDTO.g.dart';

@JsonSerializable()
class VideoDTO {
  num id;
  String title;
  String youtubeUrl;
  bool isAd;
  String url;
  String img;

  String get imgVideo {
    return !isAd
        ? 'https://i.ytimg.com/vi/${youtubeUrl?.split('v=')[1] ?? ''}/hqdefault.jpg'
        : '';
  }

  VideoDTO(
      {this.id, this.title, this.youtubeUrl, this.isAd, this.url, this.img});

  factory VideoDTO.fromJson(Map<String, dynamic> json) =>
      _$VideoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDTOToJson(this);
}
