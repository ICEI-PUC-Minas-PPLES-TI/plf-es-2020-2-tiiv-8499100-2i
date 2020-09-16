import 'package:hive/hive.dart';

part 'post_entity.g.dart';

@HiveType(typeId: 0)
class PostEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  String date;

  @HiveField(4)
  String img;

  PostEntity({this.id, this.title, this.body, this.date, this.img});
}
