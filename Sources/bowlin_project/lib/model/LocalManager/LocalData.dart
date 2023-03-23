import 'package:bowl_in/model/IManager.dart';
import '../../database/sqlflite/UserDataBase.dart';
import 'GameManager.dart';
import 'UserManager.dart';

class LocalData extends IManager {
  final UserDatabase userDatabase = UserDatabase();

  LocalData() {
    userMgr = UserManager(this);
    gameMgr = GameManager(this);
  }
}
