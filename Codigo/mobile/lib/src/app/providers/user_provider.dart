import 'package:hive/hive.dart';
import 'package:inteligenciaindustrialapp/src/app/models/entities/user/user_entity.dart';

class UserProvider {
  var userBox = Hive.box<UserEntity>('users');
  List<UserEntity> get users => userBox.values.toList();

  saveUser(UserEntity user) {
    return userBox.put(user.uid, user);
  }

  saveListUsers(List<UserEntity> list) {
    if (list == null) return;

    list.forEach((activity) => saveUser(activity));
  }

  void deleteUser(id) {
    userBox.delete(id);
  }

  UserEntity get loggedUser {
    if (users == null || users.isEmpty) return null;
    return users.firstWhere((element) => element.logged, orElse: null);
  }
}
