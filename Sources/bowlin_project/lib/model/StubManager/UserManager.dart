library StubLib;

import '../IUserManager.dart';
import '../Player.dart';
import '../User.dart';
import 'AuthManager.dart';
import 'StubData.dart';

class UserManager extends IUserManager {
  final StubData parent;

  // Constructor
  UserManager(this.parent) : super(AuthManager(parent));

  // Methods
  List<Player> getUsersByName(String name) {
    List<Player> players = [];
    for (var player in parent.players) {
      if (player.name == name) {
        players.add(player);
      }
    }
    return players;
  }

  Player getUserById(int id) {
    for (var player in parent.players) {
      if (player is User && player.id == id) {
        return player;
      }
    }
    throw new Exception("Player not found");
  }

  @override
  List<User> getRankingWithFriends() {
    List<User> sortedPlayers = List.from(parent.userCurrent.friends);
    sortedPlayers.sort((a, b) => b.stat.highscore.compareTo(a.stat.highscore));
    return sortedPlayers;
  }

  @override
  saveUser(User user) {
    return ;
  }
}
