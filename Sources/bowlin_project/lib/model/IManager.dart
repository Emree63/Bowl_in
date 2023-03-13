import 'package:bowl_in/model/GamePlayer.dart';

import 'User.dart';
import 'Game.dart';
import 'IUserManager.dart';
import 'IGameManager.dart';
import 'Game.dart';

abstract class IManager {
  late User _userCurrent;
  late Game _gameCurrent;
  late GamePlayer _gamePlayer;
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  // Getters and setters
  User get userCurrent => _userCurrent;

  set userCurrent(User user) {
    _userCurrent = user;
  }

  GamePlayer get gamePlayer => _gamePlayer;

  set gamePlayer(GamePlayer value) {
    _gamePlayer = value;
  }

  Game get gameCurrent => _gameCurrent;
  IUserManager get userMgr => _userMgr;
  IGameManager get gameMgr => _gameMgr;
}
