library StubLib;

import '../IUserManager.dart';
import '../IAuthManager.dart';
import '../Player.dart';
import 'AuthManager.dart';
import 'StubData.dart';
import '../Player.dart';
import '../Stat.dart';

class UserManager extends IUserManager {
  final StubData parent;

  // Constructor
  UserManager(this.parent) : super(AuthManager(parent));

  // Methods
  List<Player> getUsersByName(String name) {
    List<Player> players = [];
    for (var player in parent.players)
    {
      if (player.name == name)
      {
        players.add(player);
      }
    }
    return players;
  }

  Player getUserById(int id) {
    for (var player in parent.players)
    {
      if (player.id == id)
      {
        return player;
      }
    }
    throw new Exception("Player not found");
  }
}
