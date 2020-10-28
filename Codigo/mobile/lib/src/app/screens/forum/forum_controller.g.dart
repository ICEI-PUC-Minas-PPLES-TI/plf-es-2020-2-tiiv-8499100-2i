// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForumController on _ForumControllerBase, Store {
  final _$_ForumControllerBaseActionController =
      ActionController(name: '_ForumControllerBase');

  @override
  dynamic getForums() {
    final _$actionInfo = _$_ForumControllerBaseActionController.startAction();
    try {
      return super.getForums();
    } finally {
      _$_ForumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getForum(num id) {
    final _$actionInfo = _$_ForumControllerBaseActionController.startAction();
    try {
      return super.getForum(id);
    } finally {
      _$_ForumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<bool> createForum(String title, String body, String uid) {
    final _$actionInfo = _$_ForumControllerBaseActionController.startAction();
    try {
      return super.createForum(title, body, uid);
    } finally {
      _$_ForumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<bool> answerForum(String body, String uid, num idForum) {
    final _$actionInfo = _$_ForumControllerBaseActionController.startAction();
    try {
      return super.answerForum(body, uid, idForum);
    } finally {
      _$_ForumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendStatistic(String forumId) {
    final _$actionInfo = _$_ForumControllerBaseActionController.startAction();
    try {
      return super.sendStatistic(forumId);
    } finally {
      _$_ForumControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
