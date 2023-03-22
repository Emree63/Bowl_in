import 'package:bowl_in/model/IManager.dart';
import 'package:localstorage/localstorage.dart';

import '../IGameManager.dart';
import '../IUserManager.dart';
import 'GameManager.dart';
import 'UserManager.dart';

class LocalData extends IManager{
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  final LocalStorage storage = LocalStorage('local_key');

  LocalData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
  }

  IUserManager get userMgr => _userMgr;

  IGameManager get gameMgr => _gameMgr;

}