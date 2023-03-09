library LocalLib;

import '../IGameManager.dart';
import '../GameDetail.dart';
import '../Player.dart';
import '../User.dart';
import '../Guest.dart';
import 'LocalData.dart';
import 'package:uuid/uuid.dart';

class GameManager extends IGameManager {
  final LocalData parent;

  // Constructor
  GameManager(this.parent);

  // Methods
  @override
  GameDetail getGameById(Uuid id) {
    for (var element in parent.games) {
      if (element.id == id) {
        for (var gd in parent.gameDetails) {
          if (element.id == gd.id) {
            return gd;
          }
        }
        throw Exception("No GameDetail found corresponding to the given id");
      }
    }
    throw Exception("No Game found corresponding to the given id");
  }

  @override
  List<GameDetail> getGamesByPlayerId(Uuid id) {
    List<GameDetail> games = [];
    for (var element in parent.gameDetails) {
      if (element.players.contains(id)) {
        games.add(element);
      }
    }
    return games;
  }

  @override
  List<GameDetail> getGamesByPlayer(Player user) {
    throw Exception("Impossible to get games by player with LocalStorage.");
  }

  @override
  List<GameDetail> getGamesByPlayers(List<Player> users) {
    throw Exception("Impossible to get games by players with LocalStorage.");
  }

  @override
  List<User> getPlayersByIdGame(Uuid id) {
    return [];
  }

  @override
  Map<int, Uuid> getRankByIdGame(Uuid id) {
    return {};
  }
}
