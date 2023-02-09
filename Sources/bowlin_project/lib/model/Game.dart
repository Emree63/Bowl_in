import 'dart:ffi';

import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Game {
  var _id;

  get id => _id;

  set id(value) {
    _id = value;
  }

  DateTime _time;

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  final Map<Uuid, Int> _players;

  Map<Uuid, Int> get players => _players;

  final Uuid _winner;

  Uuid get winner => _winner;

  Game(this._id, this._time, this._players, this._winner);
}
