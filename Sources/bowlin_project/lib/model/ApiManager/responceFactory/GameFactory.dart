import 'package:bowl_in/model/GameDetail.dart';

import '../../Game.dart';
import '../../Player.dart';
import '../../User.dart';

class GameFactory {
  static Map<String, dynamic> toJson(Game game, User user,) {
    return {
      GameFields.id: game.id,
      GameFields.date: game.date.toIso8601String(),
      GameFields.pointsCurrentUser: game.pointsCurrentUser,
      GameFields.userId: user.id,
    };
  }

  static Map<String, dynamic> toJsonDetails(GameDetail game) {
    return {
      GameFields.id: game.id,
      GameFields.date: game.date.toIso8601String(),
      GameFields.pointsCurrentUser: game.pointsCurrentUser,
      GameFields.userId: user.id,
    };
  }

  static Game toModel(Map<String, dynamic> json, List<Player> players) {
    return Game(
        json[GameFields.id],
        DateTime.parse(json[GameFields.date]),
        json[GameFields.pointsCurrentUser],
        players
    );
  }
}