import 'package:json_annotation/json_annotation.dart';

part 'PostDTO.g.dart';

@JsonSerializable()
class PostDTO {
  num id;
  String title;
  String body;
  String date;
  String img;
  bool requiresLogin;
  bool isAd;
  String url;

  PostDTO(
      {this.id,
      this.title,
      this.body,
      this.date,
      this.img,
      this.requiresLogin,
      this.isAd,
      this.url});

  factory PostDTO.fromJson(Map<String, dynamic> json) =>
      _$PostDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostDTOToJson(this);
}
