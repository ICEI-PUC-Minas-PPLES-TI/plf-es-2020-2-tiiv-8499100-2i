// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TranslationsController on _TranslationsController, Store {
  final _$currentLanguageAtom =
      Atom(name: '_TranslationsController.currentLanguage');

  @override
  String get currentLanguage {
    _$currentLanguageAtom.context.enforceReadPolicy(_$currentLanguageAtom);
    _$currentLanguageAtom.reportObserved();
    return super.currentLanguage;
  }

  @override
  set currentLanguage(String value) {
    _$currentLanguageAtom.context.conditionallyRunInAction(() {
      super.currentLanguage = value;
      _$currentLanguageAtom.reportChanged();
    }, _$currentLanguageAtom, name: '${_$currentLanguageAtom.name}_set');
  }

  final _$currentLocaleAtom =
      Atom(name: '_TranslationsController.currentLocale');

  @override
  Locale get currentLocale {
    _$currentLocaleAtom.context.enforceReadPolicy(_$currentLocaleAtom);
    _$currentLocaleAtom.reportObserved();
    return super.currentLocale;
  }

  @override
  set currentLocale(Locale value) {
    _$currentLocaleAtom.context.conditionallyRunInAction(() {
      super.currentLocale = value;
      _$currentLocaleAtom.reportChanged();
    }, _$currentLocaleAtom, name: '${_$currentLocaleAtom.name}_set');
  }

  final _$setNewLanguageAsyncAction = AsyncAction('setNewLanguage');

  @override
  Future setNewLanguage(String newLanguage) {
    return _$setNewLanguageAsyncAction
        .run(() => super.setNewLanguage(newLanguage));
  }

  @override
  String toString() {
    final string =
        'currentLanguage: ${currentLanguage.toString()},currentLocale: ${currentLocale.toString()}';
    return '{$string}';
  }
}
