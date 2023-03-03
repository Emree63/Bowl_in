library StubLib;

import '../Game.dart';
import '../IGameManager.dart';
import '../GameDetail.dart';
import '../Player.dart';
import '../User.dart';
import '../Guest.dart';
import 'StubData.dart';
import 'package:uuid/uuid.dart';

class GameManager extends IGameManager {
  List<GameDetail> games = [];
  final StubData parent;

  // Constructor
  GameManager(this.parent);

  // Methods
  GameDetail getGameById(Uuid id) {
    for (var element in parent.gameDetails) {
      if (element.id == id) {
        return element;
      }
    }
    throw Exception("Game not found.");
  }

  List<GameDetail> getGamesByPlayerId(Uuid id) {
    List<GameDetail> games = [];
    for (var element in parent.gameDetails) {
      if (element.players.contains(id)) {
        games.add(element);
      }
    }
    throw Exception("Game not found.");
  }

  List<GameDetail> getGamesByPlayer(Player user) {
    return [];
  }

  List<GameDetail> getGamesByPlayers(List<Player> users) {
    return [];
  }

  List<User> getPlayersByIdGame(Uuid id) {
    return [];
  }

  Map<int, Uuid> getRankByIdGame(Uuid id) {
    return {};
  }
}
