import '../../Stat.dart';
import '../../User.dart';
import '../fields/StatsField.dart';

class StatsFactory {
  static Stat fromJson(Map<String, dynamic> json) {
    return Stat(
        json[StatsFields.nbVictories],
        json[StatsFields.nbGames],
        json[StatsFields.highscore],
        json[StatsFields.nbStrikes],
        json[StatsFields.nbSpares],
        0,
        json[StatsFields.avgScore],
        json[StatsFields.avgPinsPerRound]
    );

  }
  static Map<String, dynamic> toJson(Stat stat, User user) {
    return {
      StatsFields.user: user.id,
      StatsFields.nbVictories:stat.nbVictory,
      StatsFields.nbGames: stat.nbGames,
      StatsFields.highscore: stat.highscore,
      StatsFields.nbStrikes: stat.nbStrikes,
      StatsFields.nbSpares: stat.nbSpares,
      StatsFields.avgScore:stat.avgScore,
      StatsFields.avgPinsPerRound: stat.avgPinsPerRound
    };
  }
}