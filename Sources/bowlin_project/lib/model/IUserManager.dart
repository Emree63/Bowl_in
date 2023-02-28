import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'User.dart';

abstract class IUserManager {
  IAuthManager _authMgr;

  // Methods
  IAuthManager get authMgr => _authMgr;
  List<User> getUsersByName(String name);
  User getUserById(Uuid id);
}
