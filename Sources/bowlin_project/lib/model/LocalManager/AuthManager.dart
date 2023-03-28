import 'package:bowl_in/model/IAuthManager.dart';
import 'package:bowl_in/model/LocalManager/LocalData.dart';

class AuthManager extends IAuthManager {
  final LocalData parent;

  // Constructor
  AuthManager(this.parent);

  @override
  bool verifiedUser(String mail, String password) {
    // TODO: implement verifiedUser
    throw UnimplementedError();
  }

}