library StubLib;
import '../IManager.dart';

class StubData extends IManager {
  IUserManager _userMgr = new UserManager();
  IGameManager _gameMgr = new GameManger();
}