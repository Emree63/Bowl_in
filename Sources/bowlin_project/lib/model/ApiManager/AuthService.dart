
import 'package:bowl_in/model/ApiManager/ApiManager.dart';

import '../IAuthManager.dart';

class AuthService extends IAuthManager {
  final ApiManager parent;

  AuthService(this.parent);
  @override
  bool verifiedUser(String mail, String password) {
    // TODO: implement verifiedUser
    throw UnimplementedError();
  }


  // Constructor
 /* AuthManager(this.parent);
  // Methods
  bool verifiedUser(String mail, String password) {
    for (var user in parent.players) {
      if (user is User && user.mail == mail) {
        parent.userCurrent = user as User;
        return true;
      }
    }
    return false;
  }*/
}
