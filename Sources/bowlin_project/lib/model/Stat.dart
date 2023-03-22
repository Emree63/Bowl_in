import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/Player.dart';

import 'User.dart';

class Stat {
  int _nbVictory;
  int _nbGames;
  int _highscore;
  int _nbStrikes;
  int _nbSpares;
  int _nbScore;
  double _avgScore;
  double _avgPinsPerRound;

  // Constructor
  Stat(
    this._nbVictory,
    this._nbGames,
    this._highscore,
    this._nbStrikes,
    this._nbSpares,
    this._nbScore,
    this._avgScore,
    this._avgPinsPerRound,
  );

  // Getters and setters
  int get nbVictory => _nbVictory;

  set nbVictory(int value) {
    _nbVictory = value;
  }

  int get nbGames => _nbGames;

  set nbGames(int value) {
    _nbGames = value;
  }

  int get highscore => _highscore;

  set highscore(int value) {
    _highscore = value;
  }

  int get nbStrikes => _nbStrikes;

  set nbStrikes(int value) {
    _nbStrikes = value;
  }

  int get nbSpares => _nbSpares;

  set nbSpares(int value) {
    _nbSpares = value;
  }

  int get nbScore => _nbScore;

  set nbScore(int value) {
    _nbScore = value;
  }

  double get avgScore => _avgScore;

  set avgScore(double value) {
    _avgScore = value;
  }

  double get avgPinsPerRound => _avgPinsPerRound;

  set avgPinsPerRound(double value) {
    _avgPinsPerRound = value;
  }

  void updateStats(GameDetail gd, Player p){
    nbGames +=1;
    if(gd.winner == p){
      nbVictory +=1;
    }

    if((gd.points[p] ??  0) > highscore){
      highscore = gd.points[p] ?? 0;
    }

    double totalpins = 0;
    for(var r in gd.rounds){

      if(p == r.player){
        nbStrikes += r.getNbStrike();
        nbSpares += r.getNbSpares();
        totalpins = totalpins + r.getPinsKnockedDown();
      }
    }
    avgPinsPerRound = ((avgPinsPerRound * (nbGames-1)) + (totalpins/10))/nbGames;

  }


  // Serialize to JSON
  Map<String, dynamic> toJson() => {
    'nbVictory': nbVictory,
    'nbGames': nbGames,
    'highscore': highscore,
    'nbStrikes': nbStrikes,
    'nbSpares': nbSpares,
    'nbScore': nbScore,
    'avgScore': avgScore,
    'avgPinsPerRound': avgPinsPerRound,
  };
}
