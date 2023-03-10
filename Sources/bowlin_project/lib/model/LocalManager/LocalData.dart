library LocalLib;

import '../IManager.dart';
import '../IGameManager.dart';
import '../GameDetail.dart';
import '../Game.dart';
import '../User.dart';
import 'GameManager.dart';
import 'package:localstorage/localstorage.dart';

class LocalData extends IManager {
  late IGameManager _gameMgr;

  final LocalStorage storage = LocalStorage('local_key');

  late User user;
  List<GameDetail> gameDetails = [];
  List<Game> games = [];

  _saveToStorage() {
    storage.setItem('user', user.toJSONEncodable());
    storage.setItem('games', toJSONEncodableGames());
    storage.setItem('gameDetails', toJSONEncodableGameDetails());
  }

  _clearStorage() async {
    await storage.clear();
  }

  toJSONEncodableGames() {
    return games.map((game) {
      return game.toJSONEncodable();
    }).toList();
  }

  toJSONEncodableGameDetails() {
    return gameDetails.map((gameDetail) {
      return gameDetail.toJSONEncodable();
    }).toList();
  }

  LocalData() {
    _gameMgr = GameManager(this);
    user = storage.getItem('user');
    games = storage.getItem('games');
    gameDetails = storage.getItem('gameDetails');
  }
}
