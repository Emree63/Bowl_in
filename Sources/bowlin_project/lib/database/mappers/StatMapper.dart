import 'package:bowl_in/database/fields/StatFields.dart';
import '../../model/Stat.dart';
import '../../model/User.dart';

class StatMapper {
  static Map<String, dynamic> toJson(Stat stat, User user) {
    return {
      StatFields.idUser: user.id,
      StatFields.nbVictory: stat.nbVictory,
      StatFields.nbGames: stat.nbGames,
      StatFields.highscore: stat.highscore,
      StatFields.nbStrikes: stat.nbStrikes,
      StatFields.nbSpares: stat.nbSpares,
      StatFields.nbScore: stat.nbScore,
      StatFields.avgScore: stat.avgScore,
      StatFields.avgPinsPerRound: stat.avgPinsPerRound
    };
  }

  static Stat toModel(Map<String, dynamic> json) {
    return Stat(
        json[StatFields.nbVictory],
        json[StatFields.nbGames],
        json[StatFields.highscore],
        json[StatFields.nbStrikes],
        json[StatFields.nbSpares],
        json[StatFields.nbScore],
        json[StatFields.avgScore],
        json[StatFields.avgPinsPerRound]
    );
  }
}
