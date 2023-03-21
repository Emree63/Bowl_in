library StubLib;

import '../IGameManager.dart';
import '../GameDetail.dart';
import '../Player.dart';
import '../User.dart';
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
        if (player is User && player.id == id) {
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
        if (player is User && user is User && player.id == user.id) {
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

  List<Player> getPlayersByIdGame(int id) {
    List<Player> players = [];
    for (var element in parent.gameDetails) {
      if (element.id == id) {
        for (var player in element.players) {
          players.add(player);
        }
        return players;
      }
    }
    throw Exception("Game not found.");
  }

  Map<Player, int> getRankByIdGame(int id) {
    for (var game in parent.gameDetails) {
      if (game.id == id) {
        return game.getRank();
      }
    }
    throw Exception("Game not found.");
  }

  @override
  addGame(GameDetail gd) {
    parent.gameDetails.add(gd);
  }

  @override
  int getNextId() {
    return parent.gameDetails.length;
  }
}
