import 'package:bowl_in/model/User.dart';

import '../fields/UserField.dart';
import 'StatsFactory.dart';

class UserFactory {
  static User toModel(Map<String, dynamic> json) {
      return User.withStat(
          json['id'],
          json['name'],
          json['photoProfile'],
          json['email'],
          [],
          [],
          StatsFactory.fromJson(json['stats'])
    );
  }

  static Map<String, dynamic> toJson(User user) {
    return {
      UserFields.id: user.id,
      UserFields.name: user.name,
      UserFields.password:'000',
      UserFields.image: user.image,
      UserFields.mail: user.mail,
      'stats': StatsFactory.toJson(user.stat, user),
    };
  }
}





