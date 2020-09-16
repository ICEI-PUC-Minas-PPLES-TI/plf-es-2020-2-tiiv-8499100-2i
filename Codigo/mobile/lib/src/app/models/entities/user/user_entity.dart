import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 7)
class UserEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String document;

  @HiveField(4)
  String companyName;

  @HiveField(5)
  String message;
}
