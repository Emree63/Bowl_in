import 'package:bowl_in/model/Game.dart';

import 'User.dart';

abstract class IManager {
  User _userCurrent;

  User get userCurrent => _userCurrent;

  set userCurrent(User value) {
    _userCurrent = value;
  }

  late Game _gameCurrent;
  List<Game> _games;

  Game get gameCurrent => _gameCurrent;

  set gameCurrent(Game value) {
    _gameCurrent = value;
  }

  List<Game> get games => _games;

  set games(List<Game> value) {
    _games = value;
  }

  IManager(this._userCurrent, this._gameCurrent, this._games);
}
