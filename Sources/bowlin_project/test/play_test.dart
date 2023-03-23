import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/GamePlayer.dart';
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

  test("Classic game", (){
    final IManager mgr = StubData();
    final List<Player> listPlayers = [mgr.userCurrent, Guest("Lucas")];

    final DateTime dateGame = DateTime.now();

    final GameDetail gd = GameDetail(
        -1,
        dateGame,
        null,
        mgr.userCurrent.id,
        listPlayers);
    mgr.gamePlayer.game = gd;
    mgr.gamePlayer.onNext(false, null);

    makeThrow(7, mgr.gamePlayer);
    makeThrow(2, mgr.gamePlayer);

    makeThrow(10, mgr.gamePlayer);

    makeThrow(5, mgr.gamePlayer);
    makeThrow(5, mgr.gamePlayer);

    makeThrow(5, mgr.gamePlayer);
    makeThrow(5, mgr.gamePlayer);

    makeThrow(3, mgr.gamePlayer);
    makeThrow(7, mgr.gamePlayer);

    makeThrow(0, mgr.gamePlayer);
    makeThrow(7, mgr.gamePlayer);

    makeThrow(10, mgr.gamePlayer);

    makeThrow(0, mgr.gamePlayer);
    makeThrow(0, mgr.gamePlayer);

    makeThrow(9, mgr.gamePlayer);
    makeThrow(0, mgr.gamePlayer);

    makeThrow(0, mgr.gamePlayer);
    makeThrow(10, mgr.gamePlayer);

    makeThrow(2, mgr.gamePlayer);
    makeThrow(2, mgr.gamePlayer);

    makeThrow(5, mgr.gamePlayer);
    makeThrow(5, mgr.gamePlayer);

    makeThrow(10, mgr.gamePlayer);

    makeThrow(3, mgr.gamePlayer);
    makeThrow(2, mgr.gamePlayer);

    makeThrow(1, mgr.gamePlayer);
    makeThrow(2, mgr.gamePlayer);

    makeThrow(7, mgr.gamePlayer);
    makeThrow(1, mgr.gamePlayer);

    makeThrow(4, mgr.gamePlayer);
    makeThrow(6, mgr.gamePlayer);

    makeThrow(1, mgr.gamePlayer);
    makeThrow(7, mgr.gamePlayer);

    makeThrow(10, mgr.gamePlayer);
    makeThrow(6, mgr.gamePlayer);
    makeThrow(2, mgr.gamePlayer);

    makeThrow(8, mgr.gamePlayer);
    makeThrow(1, mgr.gamePlayer);



    final Iterable<int> score = gd
        .getRank()
        .values;
    expect(score.first, 128);
    expect(score.last, 95);

    expect(mgr.userCurrent.games.length, 1);
    expect(mgr.userCurrent.games.first.id, mgr.gamePlayer.game.id);
    expect(mgr.userCurrent.games.first.pointsCurrentUser, 128);
    expect(mgr.userCurrent.games.first.date, dateGame);
    expect(mgr.userCurrent.games.first.players, listPlayers);

  });

}


void makeThrow(int input, GamePlayer gamePlayer){
    AbstractRound currentRound = gamePlayer.currentRound!;
    bool isFinished = currentRound.computeNext(input);
    if (currentRound.isSpareOrStrike()) {
      gamePlayer.onSpareOrStrike();
    }
    gamePlayer.onNext(isFinished, null);
}