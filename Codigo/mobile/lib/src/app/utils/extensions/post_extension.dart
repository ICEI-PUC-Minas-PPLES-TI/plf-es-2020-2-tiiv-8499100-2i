import 'package:inteligenciaindustrialapp/src/app/models/dto/post/PostDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/post/post_entity.dart';

extension PostDTOExtension on PostDTO {
  PostEntity toEntity() {
    return PostEntity()
      ..id = this?.id
      ..title = this?.title
      ..date = this?.date
      ..img = this?.img
      ..requiresLogin = this?.requiresLogin
      ..body = this?.body
      ..url = this?.url
      ..isAd = this?.isAd;
  }
}

extension PostEntityExtension on PostEntity {
  PostDTO toDTO() {
    return PostDTO()
      ..id = this?.id
      ..title = this?.title
      ..date = this?.date
      ..img = this?.img
      ..requiresLogin = this?.requiresLogin
      ..body = this?.body
      ..url = this?.url
      ..isAd = this?.isAd;
  }
}
