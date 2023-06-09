import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/IManager.dart';
import 'package:flutter/cupertino.dart';

import 'GameDetail.dart';
import 'package:go_router/go_router.dart';

import 'Round.dart';

class GamePlayer {
  late GameDetail _game;
  final IManager _parent;
  int currentRoundIndex = 0;

  GamePlayer(this._parent);

  GameDetail get game => _game;

  set game(GameDetail value) {
    currentRoundIndex = 0;
    _game = value;
  }

  AbstractRound? get currentRound {
    if (currentRoundIndex < game.rounds.length){
        return game.rounds[currentRoundIndex];
    }
    return null;
  }

  void onNext(bool isRoundFinished, BuildContext? context) {
    if (isRoundFinished) {
      print("++");
      currentRoundIndex++;
    }
    if (currentRoundIndex >= game.rounds.length) {
      print("FINISHED");

      game.id=_parent.gameMgr.getNextId();
      _parent.gameMgr.addGame(game);

      game.computeScores();
      _parent.userMgr.saveUser(_parent.userCurrent);
      _parent.gameMgr.saveGame(_game);
      context?.go("/scoreboard", extra: game);
    } else {
      print("IN GAME : " + currentRoundIndex.toString());
      if (game.rounds[currentRoundIndex] is Round) {
        print("ROUND");
      } else {
        print("LAST ROUND");
      }
      context?.pushReplacement("/in-game",
          extra: game.rounds[currentRoundIndex]);
    }
  }

  void onSpareOrStrike() {
    if (currentRoundIndex < game.rounds.length - game.players.length) {
      print("ON SPAREORSTRIKE");
      game.rounds[currentRoundIndex]
          .subscribe(game.rounds[currentRoundIndex + game.players.length]);
    }
  }
}
