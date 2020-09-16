import 'package:hive/hive.dart';

part 'symbol_category_entity.g.dart';

@HiveType(typeId: 2)
class SymbolCategoryEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;
}
