import 'package:hive/hive.dart';

part 'video_category_entity.g.dart';

@HiveType(typeId: 5)
class VideoCategoryEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;
}
