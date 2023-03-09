class Game {
  int _id;
  DateTime _time;
  int _pointsCurrentUser;
  bool _isFinished;
  List<int> _playersId = [];

  // Constructor
  Game(this._id, this._time, this._pointsCurrentUser, this._isFinished,
      this._playersId);

  // Getters and setters
  int get id => _id;

  set id(int value) {
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

  List<int> get playersId => _playersId;

  set playersId(List<int> value) {
    _playersId = value;
  }
}
