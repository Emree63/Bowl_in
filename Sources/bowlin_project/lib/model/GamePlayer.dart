import 'package:flutter/cupertino.dart';

import 'GameDetail.dart';
import 'package:go_router/go_router.dart';

import 'Round.dart';

class GamePlayer{

  late GameDetail _game;
  int currentRoundIndex = 0;

  GameDetail get game => _game;

  set game(GameDetail value) {
    currentRoundIndex = 0;
    _game = value;
  }

  void onNext(bool isRoundFinished, BuildContext context){
    if(isRoundFinished){
      print("++");
      currentRoundIndex++;
    }
    if(currentRoundIndex>=game.rounds.length){
      print("FINISHED");
      context.go("/scoreboard");
    }else{
      print("IN GAME : " + currentRoundIndex.toString());
      if(game.rounds[currentRoundIndex] is Round){
        print("ROUND");
      }else{
        print("LAST ROUND");
      }
      context.pushReplacement("/in-game", extra: game.rounds[currentRoundIndex]);
    }
  }

  void onSpareOrStrike(){
    if(currentRoundIndex<game.rounds.length-game.players.length){
      print("ON SPAREORSTRIKE");
      game.rounds[currentRoundIndex].subscribe(game.rounds[currentRoundIndex+game.players.length]);
    }
  }
}