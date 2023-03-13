import 'package:flutter/cupertino.dart';

import 'GameDetail.dart';
import 'package:go_router/go_router.dart';

class GamePlayer{

  final GameDetail game;
  int currentRoundIndex = 0;
  final BuildContext context;

  GamePlayer(this.game, this.context);

  void onNext(bool isRoundFinished){
    if(isRoundFinished){
      currentRoundIndex++;
    }
    if(currentRoundIndex>game.rounds.length){
      context.go("/scoreboard");
    }else{
      context.go("/in-game", extra: game.rounds[currentRoundIndex]);
    }
  }

  void onSpareOrStrike(){
    if(currentRoundIndex>=game.rounds.length-game.players.length){
      game.rounds[currentRoundIndex].subscribe(game.rounds[currentRoundIndex+game.players.length]);
    }
  }
}