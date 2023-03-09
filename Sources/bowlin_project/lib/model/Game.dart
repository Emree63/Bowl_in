import 'package:uuid/uuid.dart';

class Game {
  Uuid _id;
  DateTime _date;
  int _pointsCurrentUser;
  bool _isFinished;
  List<Uuid> _playersId = [];

  // Constructor
  Game(this._id, this._date, this._pointsCurrentUser, this._isFinished,
      this._playersId);

  // Getters and setters
  Uuid get id => _id;

  set id(Uuid value) {
    _id = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  int get pointsCurrentUser => _pointsCurrentUser;

  set pointsCurrentUser(int value) {
    _pointsCurrentUser = value;
  }

  bool get isFinished => _isFinished;

  set isFinished(bool value) {
    _isFinished = value;
  }

  List<Uuid> get playersId => _playersId;

  set playersId(List<Uuid> value) {
    _playersId = value;
  }
}
