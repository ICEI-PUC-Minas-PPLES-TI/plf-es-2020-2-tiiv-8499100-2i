import 'package:hive/hive.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/subcategory/symbol_subcategory_entity.dart';

class SymbolSubcategoryProvider {
  var symbolSubcategoriesBox =
      Hive.box<SymbolSubcategoryEntity>('symbols_subcategories');
  List<SymbolSubcategoryEntity> get subcategories =>
      symbolSubcategoriesBox.values.toList();

  saveSymbolSubcategory(SymbolSubcategoryEntity symbol) {
    return symbolSubcategoriesBox.put(symbol.id, symbol);
  }

  saveListSymbolSubcategories(List<SymbolSubcategoryEntity> list) {
    if (list == null) return;

    list.forEach((activity) => saveSymbolSubcategory(activity));
  }

  void deleteSymbolSubcategory(id) {
    symbolSubcategoriesBox.delete(id);
  }
}
