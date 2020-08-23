// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController2 on _HomeController6, Store {
  final _$isConnectedAtom = Atom(name: '_HomeController6.isConnected');

  @override
  bool get isConnected {
    _$isConnectedAtom.context.enforceReadPolicy(_$isConnectedAtom);
    _$isConnectedAtom.reportObserved();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.context.conditionallyRunInAction(() {
      super.isConnected = value;
      _$isConnectedAtom.reportChanged();
    }, _$isConnectedAtom, name: '${_$isConnectedAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'isConnected: ${isConnected.toString()}';
    return '{$string}';
  }
}
