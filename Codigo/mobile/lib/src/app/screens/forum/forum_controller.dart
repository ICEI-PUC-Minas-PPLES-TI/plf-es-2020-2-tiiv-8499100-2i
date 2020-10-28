import 'package:dio/dio.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/forum/ForumDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/services/forum_service.dart';
import 'package:inteligenciaindustrialapp/src/app/services/service_status_data.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/flash_helper.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:mobx/mobx.dart';

part 'forum_controller.g.dart';

class ForumController = _ForumControllerBase with _$ForumController;

abstract class _ForumControllerBase with Store {
  final _forumService = ForumService();
  ServiceStatusData<List<ForumDTO>> forums = ServiceStatusData();
  ServiceStatusData<ForumDTO> forum = ServiceStatusData();
  ServiceStatusData<bool> registerForum = ServiceStatusData();
  ServiceStatusData<bool> answerForumResponse = ServiceStatusData();

  @action
  getForums() {
    forums.setPending();
    this._forumService.getForums().then((response) {
      forums.setDone(response);
    }).catchError((error) {
      forums.setError(error);
    });
  }

  @action
  getForum(num id) {
    forum.setPending();
    this._forumService.getForum(id).then((response) {
      forum.setDone(response);
    }).catchError((error) {
      forum.setError(error);
    });
  }

  @action
  Future<bool> createForum(String title, String body, String uid) {
    FormData data =
        FormData.fromMap({'title': title, 'body': body, 'uid': uid});

    return this._forumService.createForum(forum: data).then((response) {
      registerForum.setDone(response);
      getForums();
      FlashHelper.showToast(
          frwkNavigator.currentContext, true, 'Fórum criado com sucesso!');
      return true;
    }).catchError((error) {
      registerForum.setError(error);
      FlashHelper.showToast(frwkNavigator.currentContext, false,
          'Erro ao cadastrar fórum, por favor tente novamente!');
      return false;
    });
  }

  @action
  Future<bool> answerForum(String body, String uid, num idForum) {
    FormData data = FormData.fromMap({'body': body, 'uid': uid});

    return this
        ._forumService
        .answerForum(forum: data, idForum: idForum)
        .then((response) {
      answerForumResponse.setDone(response);
      getForum(idForum);
      FlashHelper.showToast(
          frwkNavigator.currentContext, true, 'Fórum respondido com sucesso!');
      return true;
    }).catchError((error) {
      answerForumResponse.setError(error);
      FlashHelper.showToast(frwkNavigator.currentContext, false,
          'Erro ao responder fórum, por favor tente novamente!');
      return false;
    });
  }

  @action
  sendStatistic(String forumId) {
    _forumService.sendStatistic(forumId: forumId);
  }
}
