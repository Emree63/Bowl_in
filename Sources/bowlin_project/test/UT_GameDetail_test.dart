import 'package:test/test.dart';
import '../lib/model/GameDetail.dart';
import '../lib/model/Player.dart';
import '../lib/model/Round.dart';

void main() {
  group('GameDetail', () {
    List<Player> players = [
      Player(1, "Player 1", "Avatar 1"),
      Player(2, "Player 2", "Avatar 2"),
      Player(3, "Player 3", "Avatar 3")
    ];

    List<Round> rounds = [
      Round(5, 2, 7, players[2]),
      Round(7, null, 7, players[1]),
      Round(3, 3, 6, players[0]),
      Round(2, 1, 3, players[2]),
      Round(5, 2, 7, players[1]),
      Round(5, 1, 6, players[0])
    ];

    test('GetPointByPlayerId - Existing player', () {
      var gameDetail = GameDetail(
          2,
          DateTime.now().subtract(Duration(days: 2)),
          players[1].id,
          250,
          true,
          null,
          players[1].id,
          rounds,
          players);

      expect(gameDetail.getPointByPlayerId(players[0].id), 12);
    });

    test('GetPointByPlayerId - Non-existing player', () {
      var gameDetail = GameDetail(
          2,
          DateTime.now().subtract(Duration(days: 2)),
          players[1].id,
          250,
          true,
          null,
          players[1].id,
          rounds,
          players);

      expect(() => gameDetail.getPointByPlayerId(4), throwsException);
    });

    test('GetRank', () {
      var gameDetail = GameDetail(
          2,
          DateTime.now().subtract(Duration(days: 2)),
          players[1].id,
          250,
          true,
          null,
          players[1].id,
          rounds,
          players);

      var expectedRank = {2: 14, 1: 12, 3: 10};
      expect(gameDetail.getRank(), equals(expectedRank));
    });
  });
}