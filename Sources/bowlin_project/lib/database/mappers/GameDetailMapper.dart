import 'package:bowl_in/model/GameDetail.dart';

import '../../model/Player.dart';
import '../fields/GameDetailFields.dart';

class GameDetailMapper {
  static Map<String, dynamic> toJson(GameDetail gameDetail) {
    return {
      GameDetailFields.id: gameDetail.id,
      GameDetailFields.date: gameDetail.time.toIso8601String(),
      GameDetailFields.nameWinner: gameDetail.winner?.name,
      GameDetailFields.host: gameDetail.host
    };
  }

  static GameDetail toModel(
      Map<String, dynamic> json, Player? winner, List<Player> players) {
    String dateString = json[GameDetailFields.date];
    return GameDetail(
        json[GameDetailFields.id],
        DateTime.parse(dateString),
        winner,
        json[GameDetailFields.host],
        players);
  }
}
