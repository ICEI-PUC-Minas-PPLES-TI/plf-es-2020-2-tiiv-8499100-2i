import 'package:json_annotation/json_annotation.dart';

part 'ForumPostDTO.g.dart';

@JsonSerializable()
class ForumPostDTO {
  num id;
  String body;
  DateTime date;
  String user;
  bool isOriginalPost;

  ForumPostDTO({this.id, this.body, this.date, this.user, this.isOriginalPost});

  factory ForumPostDTO.fromJson(Map<String, dynamic> json) =>
      _$ForumPostDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ForumPostDTOToJson(this);
}
