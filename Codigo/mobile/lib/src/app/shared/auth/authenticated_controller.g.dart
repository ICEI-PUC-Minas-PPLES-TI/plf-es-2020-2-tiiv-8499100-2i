// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticatedController on _AuthenticatedController, Store {
  Computed<bool> _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated => (_$isAuthenticatedComputed ??=
          Computed<bool>(() => super.isAuthenticated))
      .value;

  final _$authenticatedStateAtom =
      Atom(name: '_AuthenticatedController.authenticatedState');

  @override
  AuthenticatedState get authenticatedState {
    _$authenticatedStateAtom.context
        .enforceReadPolicy(_$authenticatedStateAtom);
    _$authenticatedStateAtom.reportObserved();
    return super.authenticatedState;
  }

  @override
  set authenticatedState(AuthenticatedState value) {
    _$authenticatedStateAtom.context.conditionallyRunInAction(() {
      super.authenticatedState = value;
      _$authenticatedStateAtom.reportChanged();
    }, _$authenticatedStateAtom, name: '${_$authenticatedStateAtom.name}_set');
  }

  final _$getDadosUsuarioAsyncAction = AsyncAction('getDadosUsuario');

  @override
  Future getDadosUsuario() {
    return _$getDadosUsuarioAsyncAction.run(() => super.getDadosUsuario());
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future login(String email, String senha) {
    return _$loginAsyncAction.run(() => super.login(email, senha));
  }

  final _$deslogarAsyncAction = AsyncAction('deslogar');

  @override
  Future deslogar() {
    return _$deslogarAsyncAction.run(() => super.deslogar());
  }

  final _$_AuthenticatedControllerActionController =
      ActionController(name: '_AuthenticatedController');

  @override
  dynamic changeAuthenticatedState(AuthenticatedState state) {
    final _$actionInfo =
        _$_AuthenticatedControllerActionController.startAction();
    try {
      return super.changeAuthenticatedState(state);
    } finally {
      _$_AuthenticatedControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'authenticatedState: ${authenticatedState.toString()},isAuthenticated: ${isAuthenticated.toString()}';
    return '{$string}';
  }
}
