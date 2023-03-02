library StubLib;
import '../IUserManager.dart';

class UserManager extends IUserManager {
  IAuthManager _authMgr = new AuthManager();

  // Methods
  IAuthManager get authMgr => _authMgr;
  List<User> getUsersByName(String name) {

  }
  User getUserById(Uuid id) {

  }
}