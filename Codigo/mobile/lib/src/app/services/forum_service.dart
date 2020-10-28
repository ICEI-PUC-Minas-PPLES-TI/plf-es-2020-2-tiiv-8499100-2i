import 'package:dio/dio.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/forum/ForumDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class ForumService extends BaseService {
  Future<List<ForumDTO>> getForums() {
    return this
        .request(HttpMethod.GET, 'forum', headers: headers)
        .then((response) {
      if (response == null) return null;
      List forums = response as List;
      return forums.map((forum) => ForumDTO.fromJson(forum)).toList();
    }).catchError((error) {
      throw (error);
    });
  }

  Future<ForumDTO> getForum(num idForum) {
    return this
        .request(HttpMethod.GET, 'forum/$idForum', headers: headers)
        .then((response) {
      if (response == null) return null;
      return ForumDTO.fromJson(response);
    }).catchError((error) {
      throw (error);
    });
  }

  Future<bool> createForum({FormData forum}) {
    return this
        .request(HttpMethod.POST, 'forum', body: forum, headers: headers)
        .then((response) {
      if (response == null) return false;
      return true;
    }).catchError((error) {
      throw (error);
    });
  }

  Future<bool> answerForum({FormData forum, num idForum}) {
    return this
        .request(HttpMethod.POST, 'forum/$idForum/add_response',
            body: forum, headers: headers)
        .then((response) {
      if (response == null) return false;
      return true;
    }).catchError((error) {
      throw (error);
    });
  }

  sendStatistic({String forumId}) {
    FormData data = FormData.fromMap({
      'uid': userController.user.getData?.uid,
      'forum_id': forumId,
    });

    this.request(HttpMethod.POST, 'forum_view', headers: headers, body: data);
  }
}
