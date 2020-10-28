// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$bodyAtom = Atom(name: '_HomeControllerBase.body');

  @override
  Widget get body {
    _$bodyAtom.context.enforceReadPolicy(_$bodyAtom);
    _$bodyAtom.reportObserved();
    return super.body;
  }

  @override
  set body(Widget value) {
    _$bodyAtom.context.conditionallyRunInAction(() {
      super.body = value;
      _$bodyAtom.reportChanged();
    }, _$bodyAtom, name: '${_$bodyAtom.name}_set');
  }

  final _$actionCreateForumAtom =
      Atom(name: '_HomeControllerBase.actionCreateForum');

  @override
  Function get actionCreateForum {
    _$actionCreateForumAtom.context.enforceReadPolicy(_$actionCreateForumAtom);
    _$actionCreateForumAtom.reportObserved();
    return super.actionCreateForum;
  }

  @override
  set actionCreateForum(Function value) {
    _$actionCreateForumAtom.context.conditionallyRunInAction(() {
      super.actionCreateForum = value;
      _$actionCreateForumAtom.reportChanged();
    }, _$actionCreateForumAtom, name: '${_$actionCreateForumAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic init() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.init();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBody(Widget body) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setBody(body);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setActionCreateForum(Function action) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setActionCreateForum(action);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPosts() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.getPosts();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendStatisticPost({String postId}) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.sendStatisticPost(postId: postId);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
