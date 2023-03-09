library StubLib;

import '../IUserManager.dart';
import '../IAuthManager.dart';
import '../Player.dart';
import 'AuthManager.dart';
import 'StubData.dart';
import '../User.dart';
import '../Stat.dart';
import 'package:uuid/uuid.dart';

class UserManager extends IUserManager {
  final StubData parent;

  // Constructor
  UserManager(this.parent) : super(AuthManager(parent));

  // Methods
  List<User> getUsersByName(String name) {
    return [];
  }

  Player getUserById(Uuid id) {
    for (var player in parent.players) {
      if (player.id == id) {
        return player;
      }
    }
    throw new Exception("Player not found");
  }
}
