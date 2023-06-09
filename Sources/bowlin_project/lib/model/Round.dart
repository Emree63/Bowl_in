import 'package:bowl_in/model/AbstractRound.dart';

class Round extends AbstractRound {
  Round(super.firstThrow, super.secondThrow, super.points, super.player,
      super.number);

  @override
  bool computeNext(int val) {
    if (firstThrow == null) {
      firstThrow = val;
      if (previousRound?.isSpare() ?? false) {
        previousRound?.update(val);
        unsubscribePreviousRound();
      }
      if (val == 10) {
        computePoints();
        return true;
      }
      return false;
    } else if (firstThrow != 10 && secondThrow == null) {
      secondThrow = val;
    }
    computePoints();
    return true;
  }

  @override
  void computePoints() {
    points = (firstThrow ?? 0) + (secondThrow ?? 0);
    if (previousRound?.isStrike() ?? false) {
      previousRound?.update(points ?? 0);
    }
  }

  @override
  bool shotIsStrike() {
    return firstThrow == null;
  }

  @override
  int getNbSpares() {
    if (isSpare()) {
      return 1;
    }
    return 0;
  }

  @override
  int getNbStrike() {
    if (isStrike()) {
      return 1;
    }
    return 0;
  }

  @override
  int getPinsKnockedDown() {
    return (firstThrow ?? 0) + (secondThrow ?? 0);
  }

  @override
  int getMaxPinsThisShot() {
    if (firstThrow == null) {
      return 10;
    } else {
      return 10 - (firstThrow ?? 0);
    }
  }
}
