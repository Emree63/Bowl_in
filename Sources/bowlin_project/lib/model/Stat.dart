class Stat {

  int _nbVictory;
  int _nbDefeat;
  int _nbGames;
  int _highscore;
  int _nbStrikes;
  int _nbSpares;
  int _nbScore;
  int _avgScore;
  double _avgPinsPerRound;

  Round(this._nbVictory,this._nbDefeat,this._nbGames,this._highscore,this._nbStrikes,this._nbSpares,this._avgScore,this._avgPinsPerRound);


  int get nbVictory => _nbVictory;

  set nbVictory(int value) {
    _nbVictory = value;
  }

  int get nbDefeat => _nbDefeat;

  set nbDefeat(int value) {
    _nbDefeat = value;
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

  int get avgScore => _avgScore;

  set avgScore(int value) {
    _avgScore = value;
  }

  double get avgPinsPerRound => _avgPinsPerRound;

  set avgPinsPerRound(double value) {
    _avgPinsPerRound = value;
  }

}
