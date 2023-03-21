import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/Guest.dart';
import 'package:bowl_in/model/IManager.dart';
import 'package:bowl_in/model/Player.dart';
import 'package:bowl_in/model/StubManager/StubData.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Just strikes", (){
    final IManager mgr = StubData();
    final List<Player> listPlayers = [mgr.userCurrent, Guest("Lucas")];

    final GameDetail gd = GameDetail(
        -1,
        DateTime.now(),
        null,
        0,
        false,
        mgr.userCurrent.id,
        listPlayers);
    mgr.gamePlayer.game = gd;
    mgr.gamePlayer.onNext(false, null);

    AbstractRound? currentRound = mgr.gamePlayer.currentRound;
    while (currentRound != null) {
      bool isFinished = currentRound.computeNext(10);
      if (currentRound.isSpareOrStrike()) {
        mgr.gamePlayer.onSpareOrStrike();
      }
      mgr.gamePlayer.onNext(isFinished, null);
      currentRound = mgr.gamePlayer.currentRound;
    }

    final int score = gd
        .getRank()
        .values
        .first;
    expect(score, 300);
  });


}