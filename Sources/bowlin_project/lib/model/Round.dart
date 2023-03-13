import 'package:bowl_in/model/AbstractRound.dart';
import 'GamePlayer.dart';

class Round extends AbstractRound{

  GamePlayer gamePlayer;

  Round(super.firstThrow, super.secondThrow, super.points, super.player, this.gamePlayer);

  @override
  bool computeNext(int val) {
    if(firstThrow==null){
      firstThrow=val;
      if(previousRound?.isSpare() ?? false){
        previousRound?.update(val);
        unsubscribePreviousRound();
      }
      return false; //Le round n'est pas fini
    }else if(firstThrow==10){
      secondThrow=val;
      return false; //Le round n'est pas fini
    }
    computePoints();
    return true; //Le round est fini
  }

  @override
  void computePoints() {
    points = (firstThrow ?? 0)+(secondThrow ?? 0);

    if(previousRound?.isStrike() ?? false){
      previousRound?.update(points ?? 0);
    }

    if(isSpareOrStrike()){
      gamePlayer.onSpareOrStrike();
    }
    unsubscribePreviousRound();
  }


}
