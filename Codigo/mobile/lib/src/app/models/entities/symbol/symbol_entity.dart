import 'package:hive/hive.dart';

part 'symbol_entity.g.dart';

@HiveType(typeId: 1)
class SymbolEntity extends HiveObject {
  @HiveField(0)
  num id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  String img;
}
