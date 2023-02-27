import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'Achievement.dart';

class User {

  String _mail;
  List<Stat> _stats = <Stat>[];
  List<Achievement> _achievements = <Achievement>[];

  User(Uuid id, String image, String name, this._achievements, this._stats ): super(id, image, name);

  String get mail => _mail;

  set mail(String value) {
    _mail = value;
  }

  List<Achievement> get achievements => _achievements;

  set achievements(List<Achievement> value) {
    _achievements = value;
  }

  List<Stat> get stats => _stats;

  set stats(List<Stat> value) {
    _stats = value;
  }

}
