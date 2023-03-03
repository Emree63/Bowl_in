library StubLib;
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
    return new GameDetail(Uuid(), DateTime.now(), Uuid(), 290, true, null, Guest(Uuid(),"",""), [ ], [] );
  }
  List<GameDetail> getGamesByPlayerId(Uuid id) {
    return [];  
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