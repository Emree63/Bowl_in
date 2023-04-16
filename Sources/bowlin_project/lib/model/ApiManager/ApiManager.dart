
import 'package:bowl_in/model/ApiManager/GameService.dart';
import 'package:bowl_in/model/ApiManager/UserService.dart';
import 'package:http/http.dart' as http;

import '../GameDetail.dart';
import '../IGameManager.dart';
import '../IManager.dart';
import '../IUserManager.dart';

class ApiManager extends IManager {
  final httpClient = http.Client();
  final int userId = 1;

  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  ApiManager() {
    _userMgr = UserService(this);
    _gameMgr = GameService(this);
  }

  List<GameDetail> _gameDetails = [];

  List<GameDetail> get gameDetails => _gameDetails;

  set gameDetails(List<GameDetail> gameDetails) {
    _gameDetails = gameDetails;
  }

}
