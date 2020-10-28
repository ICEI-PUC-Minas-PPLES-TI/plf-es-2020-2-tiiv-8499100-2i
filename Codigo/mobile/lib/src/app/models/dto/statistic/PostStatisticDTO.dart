import 'package:json_annotation/json_annotation.dart';

part 'PostStatisticDTO.g.dart';

@JsonSerializable()
class PostStatisticDTO {
  String post_id;
  String uid;

  PostStatisticDTO({this.post_id, this.uid});

  factory PostStatisticDTO.fromJson(Map<String, dynamic> json) =>
      _$PostStatisticDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PostStatisticDTOToJson(this);
}
