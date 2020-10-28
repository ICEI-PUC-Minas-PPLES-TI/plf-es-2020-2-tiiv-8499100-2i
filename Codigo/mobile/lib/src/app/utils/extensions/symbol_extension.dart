import 'package:inteligenciaindustrialapp/src/app/models/dto/symbol/SymbolDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/symbol/category/SymbolCategoryDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/symbol/subcategory/SymbolSubcategoryDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/category/symbol_category_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/subcategory/symbol_subcategory_entity.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/symbol/symbol_entity.dart';

extension SymbolDTOExtension on SymbolDTO {
  SymbolEntity toEntity() {
    return SymbolEntity()
      ..id = this?.id
      ..title = this?.title
      ..img = this?.img
      ..body = this?.body;
  }
}

extension SymbolEntityExtension on SymbolEntity {
  SymbolDTO toDTO() {
    return SymbolDTO()
      ..id = this?.id
      ..title = this?.title
      ..img = this?.img
      ..body = this?.body;
  }
}

extension SymbolCategoryDTOExtension on SymbolCategoryDTO {
  SymbolCategoryEntity toEntity() {
    return SymbolCategoryEntity()
      ..id = this?.id
      ..name = this?.name;
  }
}

extension SymbolCategoryEntityExtension on SymbolCategoryEntity {
  SymbolCategoryDTO toDTO() {
    return SymbolCategoryDTO()
      ..id = this?.id
      ..name = this?.name;
  }
}

extension SymbolSubcategoryDTOExtension on SymbolSubcategoryDTO {
  SymbolSubcategoryEntity toEntity() {
    return SymbolSubcategoryEntity()
      ..id = this?.id
      ..name = this?.name;
  }
}

extension SymbolSubcategoryEntityExtension on SymbolSubcategoryEntity {
  SymbolSubcategoryDTO toDTO() {
    return SymbolSubcategoryDTO()
      ..id = this?.id
      ..name = this?.name;
  }
}
