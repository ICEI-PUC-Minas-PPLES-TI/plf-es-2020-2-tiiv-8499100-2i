import 'package:inteligenciaindustrialapp/src/app/models/dto/user/UserDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/user/user_entity.dart';

extension UserDTOExtension on UserDTO {
  UserEntity toEntity() {
    return UserEntity()
      ..uid = this?.uid
      ..name = this?.name
      ..phone = this?.phone
      ..document = this?.document
      ..businessName = this?.businessName
      ..message = this?.message;
  }
}

extension UserEntityExtension on UserEntity {
  UserDTO toDTO() {
    return UserDTO()
      ..uid = this?.uid
      ..name = this?.name
      ..phone = this?.phone
      ..document = this?.document
      ..businessName = this?.businessName
      ..message = this?.message;
  }
}
