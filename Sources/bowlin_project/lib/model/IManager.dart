import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/GamePlayer.dart';
import 'User.dart';
import 'IUserManager.dart';
import 'IGameManager.dart';

abstract class IManager {
  late User _userCurrent;
  late GameDetail _gameCurrent;
  late final GamePlayer _gamePlayer = GamePlayer(this);
  late final IUserManager _userMgr;
  late final IGameManager _gameMgr;

  // Getters and settersz
  User get userCurrent => _userCurrent;

  set userCurrent(User user) {
    _userCurrent = user;
  }

  GamePlayer get gamePlayer => _gamePlayer;

  GameDetail get gameCurrent => _gameCurrent;

  set gameCurrent(GameDetail value) {
    _gameCurrent = value;
  }

  IUserManager get userMgr => _userMgr;

  IGameManager get gameMgr => _gameMgr;

  set gameMgr(IGameManager value) {
    _gameMgr = value;
  }

  set userMgr(IUserManager value) {
    _userMgr = value;
  }
}
