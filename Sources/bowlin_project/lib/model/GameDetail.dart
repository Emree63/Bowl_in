import 'Player.dart';
import 'Round.dart';

class GameDetail {
  int _id;
  DateTime _time;
  int _winner;
  int _nbPoints;
  bool _isFinished;
  Round? _currentRound;
  int _host;
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
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  DateTime get time => _time;

  set time(DateTime value) {
    _time = value;
  }

  int get winner => _winner;

  set winner(int value) {
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

  int get host => _host;

  set host(int value) {
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

  int getPointByPlayerId(int id) {
    int pointPlayer = 0;
    for (var player in players) {
      if (player.id == id) {
        for (var element in rounds) {
          if (element.player == player) {
            pointPlayer += element.points ?? 0;
          }
        }
        return pointPlayer;
      }
    }
    throw Exception("Player not in the game.");
  }

  Map<int, int> getRank() {
    Map<int, int> rank = {};

    for (var player in players) {
      rank.addAll({player.id: getPointByPlayerId(player.id)});
    }
    var sortedByKeyMap = Map.fromEntries(
        rank.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return sortedByKeyMap;
  }
}
