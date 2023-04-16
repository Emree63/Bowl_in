import 'Player.dart';
import 'User.dart';
import 'IAuthManager.dart';

abstract class IUserManager {
  IAuthManager _authMgr;

  // Constructor
  IUserManager(this._authMgr);

  // Methods
  IAuthManager get authMgr => _authMgr;
  Future<List<Player>> getUsersByName(String name);
  Future<Player> getUserById(int id);
  saveUser(User user);
  List<User> getRankingWithFriends();
}
