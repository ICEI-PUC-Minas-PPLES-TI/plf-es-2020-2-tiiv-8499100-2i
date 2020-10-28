import 'package:hive/hive.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/category/symbol_category_entity.dart';

class SymbolCategoryProvider {
  var symbolCategoryBox = Hive.box<SymbolCategoryEntity>('symbols_categories');
  List<SymbolCategoryEntity> get categories =>
      symbolCategoryBox.values.toList();

  saveSymbolCategory(SymbolCategoryEntity symbol) {
    return symbolCategoryBox.put(symbol.id, symbol);
  }

  saveListSymbolCategories(List<SymbolCategoryEntity> list) {
    if (list == null) return;

    list.forEach((activity) => saveSymbolCategory(activity));
  }

  void deleteSymbolCategory(id) {
    symbolCategoryBox.delete(id);
  }
}
