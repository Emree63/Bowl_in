library LocalLib;

import '../IUserManager.dart';
import '../IAuthManager.dart';
import 'AuthManager.dart';
import 'LocalData.dart';
import '../User.dart';
import 'package:uuid/uuid.dart';

class UserManager extends IUserManager {
  final LocalData parent;

  // Constructor
  UserManager(this.parent) : super(AuthManager(parent));

  // Methods
  @override
  List<User> getUsersByName(String name) {
    List<User> returnList = [];
    parent.users.forEach((element) {
      if (element.name == name) {
        returnList.add(element);
      }
    });
    return returnList;
  }

  @override
  User getUserById(Uuid id) {
    var returnUser;
    parent.users.forEach((element) {
      if (element.id == id) {
        returnUser = element;
      }
    });
    return returnUser;
  }
}
