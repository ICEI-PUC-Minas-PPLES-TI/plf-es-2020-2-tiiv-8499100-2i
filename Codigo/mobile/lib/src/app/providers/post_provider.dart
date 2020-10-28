import 'package:hive/hive.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/post/post_entity.dart';

class PostProvider {
  var postBox = Hive.box<PostEntity>('posts');
  List<PostEntity> get posts => postBox.values.toList();

  savePost(PostEntity post) {
    return postBox.put(post.id, post);
  }

  saveListPosts(List<PostEntity> list) {
    if (list == null) return;

    list.forEach((activity) => savePost(activity));
  }

  void deletePost(id) {
    postBox.delete(id);
  }
}
