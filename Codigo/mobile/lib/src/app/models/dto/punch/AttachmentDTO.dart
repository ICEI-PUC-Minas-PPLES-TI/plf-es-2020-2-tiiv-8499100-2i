import 'package:json_annotation/json_annotation.dart';

part 'AttachmentDTO.g.dart';

@JsonSerializable()
class AttachmentDTO {
  String url;
  String data;
  AttachmentType type;

  AttachmentDTO(url, data, type);

  factory AttachmentDTO.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentDTOToJson(this);
}

enum AttachmentType { DONE, PENDING, ERROR }
