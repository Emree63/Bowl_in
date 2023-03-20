import 'Player.dart';

class Game {
  int _id;
  DateTime _date;
  int _pointsCurrentUser;
  bool _isFinished;
  List<Player> _players = [];

  // Constructor
  Game(this._id, this._date, this._pointsCurrentUser, this._isFinished,
      this._players);

  // Getters and setters
  int get id => _id;

  set id(int value) {
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

  List<Player> get players => _players;

  set playersId(List<Player> value) {
    _players = value;
  }
}
