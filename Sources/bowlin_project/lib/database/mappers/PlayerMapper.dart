import 'package:bowl_in/database/fields/PlayerFields.dart';

import '../../model/Game.dart';
import '../../model/Player.dart';

class PlayerMapper {
  static Map<String, dynamic> toJson(Player player, Game game) {
    return {
      PlayerFields.idGame: game.id,
      PlayerFields.name: player.name,
      PlayerFields.image: player.image,
    };
  }

  static Player toModel(Map<String, dynamic> json) {
    return Player(
        json[PlayerFields.name],
        json[PlayerFields.image]
    );
  }
}
