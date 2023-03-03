library LocalLib;

import '../IGameManager.dart';
import '../GameDetail.dart';
import '../Player.dart';
import '../User.dart';
import '../Guest.dart';
import 'LocalData.dart';
import 'package:uuid/uuid.dart';

class GameManager extends IGameManager {
  List<GameDetail> games = [];
  final LocalData parent;

  // Constructor
  GameManager(this.parent);

  // Methods
  @override
  GameDetail getGameById(Uuid id) {
    return GameDetail(Uuid(), DateTime.now(), Uuid(), 290, true, null,
        Guest(Uuid(), "", ""), [], []);
  }

  @override
  List<GameDetail> getGamesByPlayerId(Uuid id) {
    return [];
  }

  @override
  List<GameDetail> getGamesByPlayer(Player user) {
    return [];
  }

  @override
  List<GameDetail> getGamesByPlayers(List<Player> users) {
    return [];
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
