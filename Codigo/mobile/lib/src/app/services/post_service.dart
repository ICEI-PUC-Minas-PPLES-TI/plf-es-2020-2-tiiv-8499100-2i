import 'package:dio/dio.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/post/PostDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class PostService extends BaseService {
  Future<List<PostDTO>> getPosts() {
    return this
        .request(HttpMethod.GET, 'post', headers: headers)
        .then((response) {
      if (response == null) return null;
      List posts = response as List;
      return posts.map((post) => PostDTO.fromJson(post)).toList();
    }).catchError((error) {
      throw (error);
    });
  }

  sendStatistic({String postId}) {
    FormData data = FormData.fromMap({
      'uid': userController.user.getData?.uid,
      'post_id': postId,
    });

    this.request(HttpMethod.POST, 'post_view', headers: headers, body: data);
  }
}
