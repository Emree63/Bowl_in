import 'GameDetail.dart';
import 'Player.dart';
import 'User.dart';

abstract class IGameManager {
  // Methods
  GameDetail getGameById(int id);
  List<GameDetail> getGamesByPlayerId(int id);
  List<GameDetail> getGamesByPlayer(Player user);
  List<GameDetail> getGamesByPlayers(List<Player> users);
  List<Player> getPlayersByIdGame(int id);
  Map<Player, int> getRankByIdGame(int id);
}
