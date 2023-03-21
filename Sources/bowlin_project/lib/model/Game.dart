import 'Player.dart';

class Game {
  final int _id;
  final DateTime _date;
  final int _pointsCurrentUser;
  final List<Player> _players;

  // Constructor
  Game(this._id, this._date, this._pointsCurrentUser,
      this._players);

  int get id => _id;
  DateTime get date => _date;
  int get pointsCurrentUser => _pointsCurrentUser;
  List<Player> get players => _players;
}
