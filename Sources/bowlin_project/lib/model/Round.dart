import 'Player.dart';

class Round {
  int _firstThrow;
  int? _secondThrow;
  int _points;
  Player _player;

  // Constructor
  Round(this._firstThrow, this._secondThrow, this._points, this._player);

  // Getters and setters
  int get firstThrow => _firstThrow;

  set firstThrow(int value) {
    _firstThrow = value;
  }

  int? get secondThrow => _secondThrow;

  set secondThrow(int? value) {
    _secondThrow = value;
  }

  int get points => _points;

  set points(int value) {
    _points = value;
  }

  Player get player => _player;

  set player(Player value) {
    _player = value;
  }
}
