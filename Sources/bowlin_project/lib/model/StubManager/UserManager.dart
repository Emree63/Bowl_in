library StubLib;
import '../IUserManager.dart';
import '../IAuthManager.dart';
import 'AuthManager.dart';
import 'StubData.dart';
import '../User.dart';
import '../Stat.dart';
import 'package:uuid/uuid.dart';

class UserManager extends IUserManager {
  final StubData parent;

  // Constructor
  UserManager(this.parent):super(AuthManager(parent));

  // Methods
  List<User> getUsersByName(String name) {
    return [];
  }
  User getUserById(Uuid id) {
    return User(Uuid(),"","","",[],[], Stat(10,10,10,10,10,10,10,10,10));
  }
}