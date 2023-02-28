import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'Achievement.dart';
import 'Animal.dart';
import 'Stat.dart';

class User extends Animal {
  String _mail;
  List<Stat> _stats = <Stat>[];
  List<User> _friends = <User>[];
  List<Achievement> _achievements = <Achievement>[];

  // Constructor
  User(Uuid id, String image, String name, this._achievements, this._friends, this._stats)
      : super(id, image, name);

  // Getters and setters
  String get mail => _mail;

  set mail(String value) {
    _mail = value;
  }

  List<Achievement> get achievements => _achievements;

  set achievements(List<Achievement> value) {
    _achievements = value;
  }

  List<User> get friends => _friends;

  set friends(List<User> value) {
    _friends = value;
  }

  List<Stat> get stats => _stats;

  set stats(List<Stat> value) {
    _stats = value;
  }
}
