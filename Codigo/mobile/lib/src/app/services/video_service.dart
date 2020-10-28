import 'package:dio/dio.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/video/VideoDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/models/dto/video/category/VideoCategoryDTO.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/library/helpers/global.dart';
import 'package:inteligenciaindustrialapp/src/app/utils/network/network_service.dart';

import 'base_service.dart';

class VideoService extends BaseService {
  Future<List<VideoCategoryDTO>> getCategoriesVideos() {
    return this
        .request(HttpMethod.GET, 'video_category', headers: headers)
        .then((response) {
      if (response == null) return null;
      List categories = response as List;
      return categories
          .map((symbol) => VideoCategoryDTO.fromJson(symbol))
          .toList();
    }).catchError((error) {
      throw (error);
    });
  }

  Future<List<VideoDTO>> getVideosByCategory({String categoryId}) {
    return this
        .request(HttpMethod.GET, 'video', headers: headers)
        .then((response) {
      if (response == null) return null;
      List videos = response as List;
      return videos.map((symbol) => VideoDTO.fromJson(symbol)).toList();
    }).catchError((error) {
      throw (error);
    });
  }

  sendStatistic({String videoId}) {
    FormData data = FormData.fromMap({
      'uid': userController.user.getData?.uid,
      'video_id': videoId,
    });

    this.request(HttpMethod.POST, 'video_view', headers: headers, body: data);
  }
}
