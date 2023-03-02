import 'package:uuid/uuid.dart';
import 'Achievement.dart';
import 'Player.dart';
import 'Stat.dart';

class User extends Player {
  String _mail;
  List<Achievement> _achievements = <Achievement>[];
  List<User> _friends = <User>[];
  List<Stat> _stats = <Stat>[];

  // Constructor
  User(Uuid id, String name, String image, this._mail, this._achievements, this._friends, this._stats)
      : super(id, name, image);

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
