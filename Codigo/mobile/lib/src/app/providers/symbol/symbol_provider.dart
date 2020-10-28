import 'package:hive/hive.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/symbol_entity.dart';

class SymbolProvider {
  var symbolBox = Hive.box<SymbolEntity>('symbols');
  List<SymbolEntity> get symbols => symbolBox.values.toList();

  saveSymbol(SymbolEntity symbol) {
    return symbolBox.put(symbol.id, symbol);
  }

  saveListSymbols(List<SymbolEntity> list) {
    if (list == null) return;

    list.forEach((activity) => saveSymbol(activity));
  }

  void deleteSymbol(id) {
    symbolBox.delete(id);
  }
}
