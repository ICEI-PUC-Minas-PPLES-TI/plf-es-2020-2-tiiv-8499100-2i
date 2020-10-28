import 'package:json_annotation/json_annotation.dart';

part 'ForumStatisticDTO.g.dart';

@JsonSerializable()
class ForumStatisticDTO {
  String forum_id;
  String uid;

  ForumStatisticDTO({this.forum_id, this.uid});

  factory ForumStatisticDTO.fromJson(Map<String, dynamic> json) =>
      _$ForumStatisticDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ForumStatisticDTOToJson(this);
}
