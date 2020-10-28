import 'package:inteligenciaindustrialapp/src/app/models/dto/forum/ForumPostDTO.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ForumDTO.g.dart';

@JsonSerializable()
class ForumDTO {
  num id;
  String title;
  ForumPostDTO originalPost;
  List<ForumPostDTO> forumPosts;

  ForumDTO({this.id, this.title, this.originalPost, this.forumPosts});

  factory ForumDTO.fromJson(Map<String, dynamic> json) =>
      _$ForumDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ForumDTOToJson(this);
}
