import 'package:inteligenciaindustrialapp/src/app/models/dto/symbol/SymbolDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/symbol/category/SymbolCategoryDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/symbol/subcategory/SymbolSubcategoryDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/providers/symbol/symbol_category_provider.dart';
import 'package:inteligenciaindustrialapp/src/app/providers/symbol/symbol_provider.dart';
import 'package:inteligenciaindustrialapp/src/app/providers/symbol/symbol_subcategory_provider.dart';
import 'package:inteligenciaindustrialapp/src/app/services/service_status_data.dart';
import 'package:inteligenciaindustrialapp/src/app/services/symbol_service.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/extensions/symbol_extension.dart';
import 'package:mobx/mobx.dart';

part 'symbol_controller.g.dart';

class SymbolController = _SymbolControllerBase with _$SymbolController;

abstract class _SymbolControllerBase with Store {
  final _symbolService = SymbolService();
  ServiceStatusData<List<SymbolDTO>> symbols = ServiceStatusData();
  ServiceStatusData<List<SymbolCategoryDTO>> symbolsCategories =
      ServiceStatusData();
  ServiceStatusData<List<SymbolSubcategoryDTO>> symbolsSubcategories =
      ServiceStatusData();

  SymbolProvider symbolProvider = SymbolProvider();
  SymbolCategoryProvider symbolCategoryProvider = SymbolCategoryProvider();
  SymbolSubcategoryProvider symbolSubcategoryProvider =
      SymbolSubcategoryProvider();

  @action
  getSymbolsBySubcategory(String subcategoryId) {
    symbols.setPending();
    this
        ._symbolService
        .getSymbolsBySubcategory(subcategoryId: subcategoryId)
        .then((response) {
      symbols.setDone(response);

      if (response != null) {
        symbolProvider
            .saveListSymbols(response.map((e) => e.toEntity()).toList());
      }
    }).catchError((error) {
      List<SymbolDTO> list =
          symbolProvider.symbols?.map((e) => e.toDTO())?.toList();

      if (list != null && list.isNotEmpty) {
        symbols.setDone(list);
      } else {
        symbols.setError(error);
      }
    });
  }

  @action
  getSymbolsCategories() {
    symbolsCategories.setPending();
    this._symbolService.getCategoriesSymbols().then((response) {
      symbolsCategories.setDone(response);

      if (response != null) {
        symbolCategoryProvider.saveListSymbolCategories(
            response.map((e) => e.toEntity()).toList());
      }
    }).catchError((error) {
      List<SymbolCategoryDTO> list =
          symbolCategoryProvider.categories?.map((e) => e.toDTO())?.toList();

      if (list != null && list.isNotEmpty) {
        symbolsCategories.setDone(list);
      } else {
        symbolsCategories.setError(error);
      }
    });
  }

  @action
  getSymbolsSubcategories(String categoryId) {
    symbolsSubcategories.setPending();
    this
        ._symbolService
        .getSubcategoriesByCategorySymbols(categoryId: categoryId)
        .then((response) {
      symbolsSubcategories.setDone(response);

      if (response != null) {
        symbolSubcategoryProvider.saveListSymbolSubcategories(
            response.map((e) => e.toEntity()).toList());
      }
    }).catchError((error) {
      List<SymbolSubcategoryDTO> list = symbolSubcategoryProvider.subcategories
          ?.map((e) => e.toDTO())
          ?.toList();

      if (list != null && list.isNotEmpty) {
        symbolsSubcategories.setDone(list);
      } else {
        symbolsSubcategories.setError(error);
      }
    });
  }

  @action
  sendStatistic({String symbolId}) {
    _symbolService.sendStatistic(symbolId: symbolId);
  }
}
