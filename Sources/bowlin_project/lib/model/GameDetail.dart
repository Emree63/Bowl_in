import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/Game.dart';
import 'package:bowl_in/model/LastRound.dart';
import 'Player.dart';
import 'Round.dart';
import 'User.dart';

class GameDetail {
  int _id;
  final DateTime _time;
  Player? _winner;
  final int _host;
  final List<AbstractRound> _rounds = [];
  final List<Player> _players;
  final Map<Player, int> _points = {};

  // Constructor
  GameDetail(this._id, this._time, this._winner, this._host, this._players) {
    for (int i = 1; i <= 9; i++) {
      players.forEach((element) {
        this.rounds.add(Round(null, null, 0, element, i));
      });
    }
    players.forEach((element) {
      this.rounds.add(LastRound(null, null, 0, element, 10, null));
    });
  }

  // Getters and setters
  int get id => _id;

  set id(int value) {
    _id = value;
  }

  DateTime get time => _time;

  Player? get winner => _winner;

  set winner(Player? value) {
    _winner = value;
  }

  int get host => _host;

  List<AbstractRound> get rounds => _rounds;

  List<Player> get players => _players;

  Map<Player, int> get points => _points;

  void addGameToUsers() {
    for (var p in players) {
      if (p is User) {
        p.games.add(Game(this.id, this.time, points[p] ?? 0, players));
        p.stat.updateStats(this, p);
      }
    }
  }

  void computeWinner() {
    print(getRank().entries.first.key.name);
    this.winner = getRank().entries.first.key;
  }

  void computeScores() {
    print("====COMPUTE POINTS====");
    for (var element in rounds) {
      points[element.player] =
          (points[element.player] ?? 0) + (element.points ?? 0);
      print(element.points);
    }
    computeWinner();
    addGameToUsers();
  }

  Map<Player, int> getRank() {
    var sortedByValueMap = Map.fromEntries(points.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return sortedByValueMap;
  }
}
