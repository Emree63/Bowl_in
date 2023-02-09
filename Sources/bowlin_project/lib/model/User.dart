import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'Achievement.dart';

class User {
  //attributes from BowlIn
  Uuid _id;

  get id => _id;

  set id(value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String _name;

  List<Achievement> _achievements = <Achievement>[];

  List<Achievement> get achievements => _achievements;

  set achievements(List<Achievement> value) {
    _achievements = value;
  }

  //constructors
  User(this._id, this._name, this._achievements);
}
