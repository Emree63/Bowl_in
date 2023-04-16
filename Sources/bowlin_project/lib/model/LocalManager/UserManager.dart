import 'package:bowl_in/model/IUserManager.dart';
import 'package:bowl_in/model/LocalManager/LocalData.dart';
import 'package:bowl_in/model/Player.dart';
import 'package:bowl_in/model/User.dart';
import 'AuthManager.dart';

class UserManager extends IUserManager {
  final LocalData parent;

  // Constructor
  UserManager(this.parent) : super(AuthManager(parent)) {
    _initUser();
  }

  _initUser() async {
    //await parent.database.deleteGameDetail();
    //await parent.database.deleteUser(0);
    //User crUser = User(0, "Lucas", "./assets/images/image_user_red.png", "", [], []);
    //await saveUser(crUser);
    var user = await parent.database.readUser(0);
    if (user == null) {
      User user2 =
          User(0, "Unknown", "./assets/images/image_user_pink.png", "", [], []);
      parent.userCurrent = user2;
    } else {
      parent.userCurrent = user;
    }
  }

  @override
  saveUser(User user) async {
    var result = await parent.database.readUser(0);
    if (result == null) {
      await parent.database.createUser(user);
    } else {
      await parent.database.updateUser(user);
    }
  }

  @override
  List<User> getRankingWithFriends() {
    List<User> sortedPlayers = List.from(parent.userCurrent.friends);
    sortedPlayers.sort((a, b) => b.stat.highscore.compareTo(a.stat.highscore));
    return sortedPlayers;
  }

  @override
  Future<Player> getUserById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Player>> getUsersByName(String name) {
    throw UnimplementedError();
  }
}
