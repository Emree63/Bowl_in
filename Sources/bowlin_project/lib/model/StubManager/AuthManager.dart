library StubLib;

import '../IAuthManager.dart';
import '../User.dart';
import 'StubData.dart';

class AuthManager extends IAuthManager {
  final StubData parent;

  // Constructor
  AuthManager(this.parent);

  // Methods
  bool verifiedUser(String mail, String password) {
    for (var user in parent.players) {
      if (user is User && user.mail == mail) {
        parent.userCurrent = user;
        return true;
      }
    }
    return false;
  }
}
