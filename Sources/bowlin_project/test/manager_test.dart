import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/GameDetail.dart';
import 'package:bowl_in/model/Guest.dart';
import 'package:bowl_in/model/IManager.dart';
import 'package:bowl_in/model/Player.dart';
import 'package:bowl_in/model/StubManager/StubData.dart';
import 'package:flutter_test/flutter_test.dart';

void testManager(IManager mgr) {
  test("Test manager " + mgr.runtimeType.toString(), () {
    expect(mgr.userCurrent, mgr.userMgr.getUsersByName("Dave").first);
    expect(mgr.userCurrent, mgr.userMgr.getUserById(mgr.userCurrent.id));

    List<Player> players = [mgr.userCurrent, Guest("Emre")];
    GameDetail gd = GameDetail(
        mgr.gameMgr.getNextId(), DateTime.now(), null, 135, true, 5, players);

    mgr.gameMgr.addGame(gd);

    expect(gd, mgr.gameMgr.getGameById(gd.id));

    expect(gd, mgr.gameMgr.getGamesByPlayer(mgr.userCurrent).first);

    expect(gd, mgr.gameMgr.getGamesByPlayerId(mgr.userCurrent.id).first);

    expect(players, mgr.gameMgr.getPlayersByIdGame(gd.id));

    expect(gd, mgr.gameMgr.getGamesByPlayers(players).first);
  });
}

void main() {
  testManager(StubData());
}
