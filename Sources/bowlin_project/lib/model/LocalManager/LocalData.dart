import 'package:bowl_in/database/sqlflite/UserDataBase.dart';
import 'package:bowl_in/model/IManager.dart';
import 'GameManager.dart';
import 'UserManager.dart';

class LocalData extends IManager {
  final BowlInDatabase userDatabase = BowlInDatabase();

  LocalData() {
    userMgr = UserManager(this);
    gameMgr = GameManager(this);
  }
}
