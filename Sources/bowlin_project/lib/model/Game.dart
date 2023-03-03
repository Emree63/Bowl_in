import 'package:uuid/uuid.dart';

class Game {
  Uuid _id;
  DateTime _time;
  int _pointsCurrentUser;
  bool _isFinished;
  List<Uuid> _playerIds = [];

  // Constructor
  Game(this._id, this._time, this._pointsCurrentUser, this._isFinished,
      this._playerIds);

  // Getters and setters
  Uuid get id => _id;

  set id(Uuid value) {
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

  List<Uuid> get playerIds => _playerIds;

  set playerIds(List<Uuid> value) {
    _playerIds = value;
  }
}
