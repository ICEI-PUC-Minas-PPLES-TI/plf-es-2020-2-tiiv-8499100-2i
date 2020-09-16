import 'package:hive/hive.dart';

part 'video_entity.g.dart';

@HiveType(typeId: 4)
class VideoEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String youtubeUrl;
}
