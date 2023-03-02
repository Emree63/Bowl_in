library StubLib;
import '../IManager.dart';
import '../IUserManager.dart';
import '../IGameManager.dart';
import '../User.dart';
import '../Achievement.dart';
import '../Stat.dart';
import 'UserManager.dart';
import 'GameManager.dart';
import 'package:uuid/uuid.dart';

class StubData extends IManager {
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  StubData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
  }

  List<User> users = [
    User(Uuid(),"Emre","https://fastly.picsum.photos/id/1060/2000/2000.jpg?hmac=_RrU8GpkCDUlVKfgyWE-GcX-GS5TKNyUzdFbJAGXHV4","emre.kartal@etu.uca.fr", [Achievement("5 games"), Achievement("2 strikes in a row"), Achievement("Win a game")], [], Stat(10,2,12,130,7,6,700,58.33,30.2)),
    User(Uuid(),"Dave","https://fastly.picsum.photos/id/820/2000/2000.jpg?hmac=Ctxx2feJNZnG1S7UPx_YrWcEw89tKb7fR8i1W-VTOz4","david.d_almeida@etu.uca.fr", [Achievement("5 games"), Achievement("0 point"), Achievement("Win a game")], [], Stat(2,7,9,80,4,3,250,27.77,10.55))
  ];

}