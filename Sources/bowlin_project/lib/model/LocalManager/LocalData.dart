library LocalLib;

import '../IManager.dart';
import '../IUserManager.dart';
import '../IGameManager.dart';
import '../User.dart';
import 'UserManager.dart';
import 'GameManager.dart';
import 'package:localstorage/localstorage.dart';

class LocalData extends IManager {
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  final LocalStorage storage = LocalStorage('local_key');

  List<User> users = [];

  LocalData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
    users = storage.getItem('users');
  }

  _saveToStorage() {
    storage.setItem('users', toJSONEncodable());
  }

  _clearStorage() async {
    await storage.clear();
  }

  toJSONEncodable() {
    return users.map((user) {
      return user.toJSONEncodable();
    }).toList();
  }
}
