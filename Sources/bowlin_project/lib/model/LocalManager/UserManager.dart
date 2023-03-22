import 'dart:convert';

import 'package:bowl_in/model/IUserManager.dart';
import 'package:bowl_in/model/LocalManager/LocalData.dart';
import 'package:bowl_in/model/Player.dart';
import 'package:bowl_in/model/User.dart';

import '../Stat.dart';
import 'AuthManager.dart';

class UserManager extends IUserManager {
  final LocalData parent;

  // Constructor
  UserManager(this.parent) : super(AuthManager(parent)) {
    _initUser();
  }

  _initUser() async {
    var userJson = await parent.storage.getItem('user');
    if (userJson == null || userJson =='') {
      User user2 = User(
          1,
          "Unknown",
          "./assets/images/image_user_cyan.png",
          "",
          [],
          [],
          Stat(0, 0, 0, 0, 0, 0, 0, 0));
       parent.userCurrent = user2;


    } else {
      Map<String, dynamic> userMap = json.decode(userJson);
      User user = User(
        userMap['_id'],
        userMap['name'],
        userMap['image'],
        userMap['_mail'],
        [],
        [],
        Stat(0, 0, 0, 0, 0, 0, 2.0, 3.0),
      );
      parent.userCurrent = user;
    }
  }

  saveUser(User user) {
    String userJson = json.encode(userToMap(user));

    parent.storage.setItem('user', userJson);
  }

  Map<String, dynamic> userToMap(User user) {
    return {
      '_id': user.id,
      'name': user.name,
      'image': user.image,
      '_mail': user.mail,
    };
  }

  @override
  List<User> getRankingWithFriends() {
    // TODO: implement getRankingWithFriends
    throw UnimplementedError();
  }

  @override
  Player getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  List<Player> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}