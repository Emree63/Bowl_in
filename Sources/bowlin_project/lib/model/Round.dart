import 'package:bowl_in/model/AbstractRound.dart';
import 'GamePlayer.dart';

class Round extends AbstractRound{

  Round(super.firstThrow, super.secondThrow, super.points, super.player, super.number);

  @override
  bool computeNext(int val) {
    if(firstThrow==null){
      firstThrow=val;
      if(previousRound?.isSpare() ?? false){
        previousRound?.update(val);
        unsubscribePreviousRound();
      }
      return val==10;
    }else if(firstThrow!=10 && secondThrow!=null){
      secondThrow=val;
    }
    computePoints();
    return true;
  }

  @override
  void computePoints() {
    points = (firstThrow ?? 0)+(secondThrow ?? 0);

    if(previousRound?.isStrike() ?? false){
      previousRound?.update(points ?? 0);
    }
    unsubscribePreviousRound();
  }

  @override
  bool shotIsStrike(){
    return firstThrow==null;
  }


}
