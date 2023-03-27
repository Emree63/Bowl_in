import 'package:bowl_in/database/sqlflite/BowlInDatabase.dart';
import 'package:bowl_in/model/IManager.dart';
import '../GameDetail.dart';
import 'GameManager.dart';
import 'UserManager.dart';

class LocalData extends IManager {
  final BowlInDatabase database = BowlInDatabase();

  LocalData() {
    userMgr = UserManager(this);
    gameMgr = GameManager(this);
  }

  List<GameDetail> _gameDetails = [];

  List<GameDetail> get gameDetails => _gameDetails;

}
