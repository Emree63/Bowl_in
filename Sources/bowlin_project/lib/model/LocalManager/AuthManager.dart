library LocalLib;

import '../IAuthManager.dart';
import 'LocalData.dart';

class AuthManager extends IAuthManager {
  final LocalData parent;

  // Constructor
  AuthManager(this.parent);

  // Methods
  @override
  bool verifiedUser(String name, String password) {
    return false;
  }
}
