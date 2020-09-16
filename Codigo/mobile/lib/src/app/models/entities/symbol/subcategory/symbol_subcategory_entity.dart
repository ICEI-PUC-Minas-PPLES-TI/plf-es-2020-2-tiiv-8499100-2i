import 'package:hive/hive.dart';

part 'symbol_subcategory_entity.g.dart';

@HiveType(typeId: 3)
class SymbolSubcategoryEntity extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;
}
