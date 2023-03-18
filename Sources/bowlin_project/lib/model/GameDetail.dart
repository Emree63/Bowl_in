import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/Game.dart';
import 'package:bowl_in/model/GamePlayer.dart';
import 'package:bowl_in/model/LastRound.dart';

import 'Player.dart';
import 'Round.dart';

class GameDetail {
  int _id;
  DateTime _time;
  int? _winner;
  int _nbPoints;
  bool _isFinished;
  int _host;
  List<AbstractRound> _rounds = [];
  List<Player> _players = [];

  // Constructor
  GameDetail(
      this._id,
      this._time,
      this._winner,
      this._nbPoints,
      this._isFinished,
      this._host,
      this._players){

    for(int i=1; i<=9; i++){
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

  set time(DateTime value) {
    _time = value;
  }

  int? get winner => _winner;

  set winner(int? value) {
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

  int get host => _host;

  set host(int value) {
    _host = value;
  }

  List<AbstractRound> get rounds => _rounds;

  set rounds(List<AbstractRound> value) {
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
