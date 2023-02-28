import 'User.dart';
import 'Game.dart';

abstract class IManager {
  late User _userCurrent;
  late Game _gameCurrent;
  IUserManager _userMgr;
  IGameManager _gameMgr;

  // Constructor
  IManager(this._userCurrent, this._gameCurrent);
  
  // Getters and setters
  User get userCurrent => _userCurrent;
  Game get gameCurrent => _gameCurrent;
  IUserManager get userMgr => _userMgr;
  IGameManager get gameMgr => _gameMgr;
}
