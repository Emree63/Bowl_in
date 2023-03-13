import 'package:bowl_in/model/AbstractRound.dart';

import 'Player.dart';

class LastRound extends AbstractRound{
  int? _thirdThrow;

  LastRound(super.firstThrow, super.secondThrow, super.points, super.player, this._thirdThrow);

  int? get thirdThrow => _thirdThrow;

  set thirdThrow(int? value) {
    _thirdThrow = value;
  }

  @override
  bool computeNext(int val) {
    if(firstThrow==null){
      firstThrow=val;
      if(previousRound?.isSpare() ?? false){
        previousRound?.update(val);
      }
      return false;
    }else if(secondThrow!=null){
      secondThrow=val;
      return false;

    }else if((firstThrow??0)+(secondThrow??0)>=10){
      thirdThrow=val;
      return false;

    }
    computePoints();
    return true;
  }

  @override
  void computePoints() {
    points = (firstThrow??0)+(secondThrow??0)+(thirdThrow??0);

    if(previousRound?.isStrike()??false){
      update(points??0);
    }
    unsubscribePreviousRound();
  }


}
