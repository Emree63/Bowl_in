import 'package:bowl_in/model/GameDetail.dart';

import '../../model/User.dart';
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

  static GameDetail toModel(Map<String, dynamic> json, User winner) {
    return GameDetail(
      json[GameDetailFields.id],
      json[GameDetailFields.date],
      json[winner],
      json[GameDetailFields.host],
      [],
    );
  }
}
