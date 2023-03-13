class Game {
  int _id;
  DateTime _date;
  int _pointsCurrentUser;
  bool _isFinished;
  List<int> _playersId = [];

  // Constructor
  Game(this._id, this._date, this._pointsCurrentUser, this._isFinished,
      this._playersId);

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

  List<int> get playersId => _playersId;

  set playersId(List<int> value) {
    _playersId = value;
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['id'] = id;
    m['date'] = date;
    m['IdUsers'] = playersId;

    return m;
  }
}
