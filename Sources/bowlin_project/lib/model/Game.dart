import 'dart:ffi';

import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Game {
  
  Uuid _id;
  DateTime _time;
  int _pointsCurrentUser;
  bool _isFinished;
  List<String> _playerImages = <String>[];

  
  Game(this._id, this._time, this._players, this._winner);

  get id => _id;

  set id(value) {
    _id = value;
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  int get pointsCurrentUser => _pointsCurrentUser;

  set pointsCurrentUser(int value) {
    _pointsCurrentUser = value;
  }

  bool get isFinished => _isFinished;

  set isFinished(bool value) {
    _isFinished = value;
  }

  List<String> get playerImages => _playerImages;

  set playerImages(List<String> value) {
    _playerImages = value;
  }

}
