import 'package:uuid/uuid.dart';
import 'Player.dart';
import 'Round.dart';

class GameDetail {
  Uuid _id;
  DateTime _time;
  Uuid _winner;
  int _nbPoints;
  bool _isFinished;
  Round? _currentRound;
  Player _host;
  List<Round> _rounds = [];
  List<Player> _players = [];

  // Constructor
  GameDetail(
      this._id,
      this._time,
      this._winner,
      this._nbPoints,
      this._isFinished,
      this._currentRound,
      this._host,
      this._rounds,
      this._players);

  // Getters and setters
  Uuid get id => _id;

  set id(Uuid value) {
    _id = value;
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  Uuid get winner => _winner;

  set winner(Uuid value) {
    _winner = value;
  }

  int get nbPoints => _nbPoints;

  set nbPoints(int value) {
    _nbPoints = value;
  }

  bool get isFinished => _isFinished;

  set isFinished(bool value) {
    _isFinished = value;
  }

  Round? get currentRound => _currentRound;

  set currentRound(Round? value) {
    _currentRound = value;
  }

  Player get host => _host;

  set host(Player value) {
    _host = value;
  }

  List<Round> get rounds => _rounds;

  set rounds(List<Round> value) {
    _rounds = value;
  }

  List<Player> get players => _players;

  set players(List<Player> value) {
    _players = value;
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['id'] = id;
    m['time'] = time;
    m['winner'] = winner;
    m['nbPoints'] = nbPoints;
    m['host'] = host;
    m['rounds'] = rounds;
    m['players'] = players;

    return m;
  }
}
