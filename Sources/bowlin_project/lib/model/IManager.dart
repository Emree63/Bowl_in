import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/GamePlayer.dart';

import 'User.dart';
import 'Game.dart';
import 'IUserManager.dart';
import 'IGameManager.dart';
import 'Game.dart';

abstract class IManager {
  late User _userCurrent;
  late GameDetail _gameCurrent;
  late GamePlayer _gamePlayer = GamePlayer(this);
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

  GameDetail get gameCurrent => _gameCurrent;

  set gameCurrent(GameDetail value) {
    _gameCurrent = value;
  }

  IUserManager get userMgr => _userMgr;
  IGameManager get gameMgr => _gameMgr;
}
