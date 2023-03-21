import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/IGameManager.dart';
import 'package:bowl_in/model/LocalManager/LocalData.dart';
import 'package:bowl_in/model/Player.dart';

class GameManager extends IGameManager {
  final LocalData parent;
  
  // Constructor
  GameManager(this.parent);

  @override
  addGame(GameDetail gd) {
    // TODO: implement addGame
    throw UnimplementedError();
  }

  @override
  GameDetail getGameById(int id) {
    // TODO: implement getGameById
    throw UnimplementedError();
  }

  @override
  List<GameDetail> getGamesByPlayer(Player user) {
    // TODO: implement getGamesByPlayer
    throw UnimplementedError();
  }

  @override
  List<GameDetail> getGamesByPlayerId(int id) {
    // TODO: implement getGamesByPlayerId
    throw UnimplementedError();
  }

  @override
  List<GameDetail> getGamesByPlayers(List<Player> users) {
    // TODO: implement getGamesByPlayers
    throw UnimplementedError();
  }

  @override
  int getNextId() {
    // TODO: implement getNextId
    throw UnimplementedError();
  }

  @override
  List<Player> getPlayersByIdGame(int id) {
    // TODO: implement getPlayersByIdGame
    throw UnimplementedError();
  }

  @override
  Map<Player, int> getRankByIdGame(int id) {
    // TODO: implement getRankByIdGame
    throw UnimplementedError();
  }
}