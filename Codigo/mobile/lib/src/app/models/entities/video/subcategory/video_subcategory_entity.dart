import 'package:hive/hive.dart';

part 'video_subcategory_entity.g.dart';

@HiveType(typeId: 6)
class VideoSubcategoryEntity extends HiveObject {
  @HiveField(0)
  num id;

  @HiveField(1)
  String name;
}
