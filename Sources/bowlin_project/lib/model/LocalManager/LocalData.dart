library LocalLib;

import '../IManager.dart';
import '../IUserManager.dart';
import '../IGameManager.dart';
import '../Round.dart';
import '../Stat.dart';
import '../GameDetail.dart';
import '../Game.dart';
import '../Achievement.dart';
import '../User.dart';
import 'UserManager.dart';
import 'GameManager.dart';
import 'package:localstorage/localstorage.dart';

class LocalData extends IManager {
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  final LocalStorage storage = LocalStorage('local_key');

  List<User> users = [];
  List<GameDetail> gameDetails = [];
  List<Game> games = [];

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

  LocalData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
    users = storage.getItem('users');
    games = storage.getItem('games');
    gameDetails = storage.getItem('gameDetails');
  }
}
