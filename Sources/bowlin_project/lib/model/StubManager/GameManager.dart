library StubLib;

import '../Game.dart';
import '../IGameManager.dart';
import '../GameDetail.dart';
import '../Player.dart';
import '../User.dart';
import '../Guest.dart';
import 'StubData.dart';

class GameManager extends IGameManager {
  final StubData parent;

  // Constructor
  GameManager(this.parent);

  // Methods
  GameDetail getGameById(int id) {
    for (var element in parent.gameDetails) {
      if (element.id == id) {
        return element;
      }
    }
    throw Exception("Game not found.");
  }

  List<GameDetail> getGamesByPlayerId(int id) {
    List<GameDetail> games = [];
    for (var element in parent.gameDetails) {
      for (Player player in element.players) {
        if (player.id == id) {
          games.add(element);
          break;
        }
      }
    }
    return games;
  }

  List<GameDetail> getGamesByPlayer(Player user) {
    List<GameDetail> games = [];
    for (var element in parent.gameDetails) {
      for (Player player in element.players) {
        if (player.id == user.id) {
          games.add(element);
          break;
        }
      }
    }
    return games;
  }

  List<GameDetail> getGamesByPlayers(List<Player> users) {
    List<GameDetail> games = [];
    for (var element in parent.gameDetails) {
      if (element.players.toSet().containsAll(users.toSet())) {
        games.add(element);
      }
    }
    return games;
  }

  List<User> getPlayersByIdGame(int id) {
    return [];
  }

  Map<int, int> getRankByIdGame(int id) {
    return {};
  }
}
