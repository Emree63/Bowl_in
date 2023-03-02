library StubLib;
import '../IGameManager.dart';

class GameManager extends IGameManager {
  List<GameDetail> games = [];

  // Methods
  GameDetail getGameById(Uuid id) {

  }
  List<GameDetail> getGamesByPlayerId(Uuid id) {

  }
  List<GameDetail> getGamesByPlayer(Player user) {

  }
  List<GameDetail> getGamesByPlayers(List<Player> users) { 

  }
  List<User> getPlayersByIdGame(Uuid id) {

  }
  Map<int, Uuid> getRankByIdGame(Uuid id) {
    
  }
}