import '../../model/Stat.dart';
import '../../model/User.dart';
import '../fields/UserFields.dart';

class UserMapper {
  static Map<String, dynamic> toJson(User user) {
    return {
      UserFields.id: user.id,
      UserFields.name: user.name,
      UserFields.image: user.image,
      UserFields.mail: user.mail,
    };
  }

  static User toModel(Map<String, dynamic> json, Stat stat) {
    return User.withStat(
      json[UserFields.id],
      json[UserFields.name],
      json[UserFields.image],
      json[UserFields.mail],
      [],
      [],
      stat
    );
  }
}
