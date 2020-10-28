import 'package:hive/hive.dart';

part 'post_entity.g.dart';

@HiveType(typeId: 0)
class PostEntity extends HiveObject {
  @HiveField(0)
  num id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  String date;

  @HiveField(4)
  String img;

  @HiveField(5)
  bool requiresLogin;

  @HiveField(6)
  bool isAd;

  @HiveField(7)
  String url;

  PostEntity(
      {this.id,
      this.title,
      this.body,
      this.date,
      this.img,
      this.requiresLogin,
      this.isAd,
      this.url});
}
