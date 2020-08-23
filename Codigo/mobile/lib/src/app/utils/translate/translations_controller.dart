import 'dart:ui';

import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:mobx/mobx.dart';

import 'preferences.dart';

part 'translations_controller.g.dart';

class TranslationsController = _TranslationsController
    with _$TranslationsController;

abstract class _TranslationsController with Store {
  @observable
  var currentLanguage = frwkLanguage.currentLanguage;

  @observable
  var currentLocale = frwkLanguage.locale;

  @action
  setNewLanguage(String newLanguage) async {
    print('setNewLanguage: $newLanguage');
    await preferences.setPreferredLanguage(newLanguage);
    await frwkLanguage.setNewLanguage(newLanguage);
    currentLanguage = frwkLanguage.currentLanguage;
    currentLocale = frwkLanguage.locale;
  }
}
