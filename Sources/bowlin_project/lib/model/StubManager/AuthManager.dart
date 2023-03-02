library StubLib;
import '../IAuthManager.dart';
import 'StubData.dart';

class AuthManager extends IAuthManager {
  final StubData parent;

  // Constructor
  AuthManager(this.parent);
  // Methods
  bool verifiedUser(String name, String password) {
      return false;
  }
}