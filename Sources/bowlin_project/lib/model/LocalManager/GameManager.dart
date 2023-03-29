import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/IGameManager.dart';
import 'package:bowl_in/model/LocalManager/LocalData.dart';
import 'package:bowl_in/model/Player.dart';

import '../User.dart';

class GameManager extends IGameManager {
  final LocalData parent;

  // Constructor
  GameManager(this.parent){
    _initGame();
  }

  // Methods
  _initGame() async {
    parent.gameDetails = await parent.database.readGameDetail();
  }

  GameDetail getGameById(int id) {
    for (var element in parent.gameDetails) {
      if (element.id == id) {
        return element;
      }
    }
    throw Exception("Game not found.");
  }

  saveGame(GameDetail gameDetail) async {
    await parent.database.createGameDetail(gameDetail);
  }

  @override
  List<GameDetail> getGamesByPlayerId(int id) {
    return parent.gameDetails.where((element) =>
        element.players.any((player) => player is User && player.id == id)
    ).toList();
  }

  @override
  List<GameDetail> getGamesByPlayer(Player user) {
    return parent.gameDetails
        .where((element) =>
        element.players.any((player) => player is User && user is User && player.id == user.id))
        .toList();
  }

  @override
  List<GameDetail> getGamesByPlayers(List<Player> users) {
    List<GameDetail> games = [];
    for (var element in parent.gameDetails) {
      if (element.players.toSet().containsAll(users.toSet())) {
        games.add(element);
      }
    }
    return games;
  }

  @override
  List<Player> getPlayersByIdGame(int id) {
    final gameDetails = parent.gameDetails.firstWhere(
            (element) => element.id == id,
        orElse: () => throw Exception("Game not found.")
    );
    return gameDetails.players;
  }

  @override
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
