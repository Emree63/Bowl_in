library StubLib;

import '../IManager.dart';
import '../Game.dart';
import '../IUserManager.dart';
import '../IGameManager.dart';
import '../Player.dart';
import '../Round.dart';
import '../User.dart';
import '../Achievement.dart';
import '../GameDetail.dart';
import '../Stat.dart';
import 'UserManager.dart';
import 'GameManager.dart';

class StubData extends IManager {
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  StubData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
    _initRounds();
    _initGameDetails();
    _initGame();
    userCurrent = players[8] as User;
    userCurrent.games = games;
  }

  IUserManager get userMgr => _userMgr;

  IGameManager get gameMgr => _gameMgr;

  List<Player> players = [
    Player(1, "Mathieu", "./assets/images/image_user_cyan.png"),
    Player(2, "Robin", "./assets/images/image_user_purple.png"),
    Player(3, "Lucas", "./assets/images/image_user_red.png"),
    Player(4, "Emre", "./assets/images/image_user_blue.png"),
    Player(5, "Louison", "./assets/images/image_user_cyan.png"),
    Player(6, "Arthur", "./assets/images/image_user_yellow.png"),
    Player(7, "David", "./assets/images/image_user_pink.png"),
    User(
        8,
        "Emre",
        "./assets/images/image_user_cyan.png",
        "emre.kartal@etu.uca.fr",
        [
          Achievement("5 games"),
          Achievement("2 strikes in a row"),
          Achievement("Win a game")
        ],
        [],
        Stat(10, 2, 12, 130, 7, 6, 700, 58.33, 30.2)),
    User(
        9,
        "Dave",
        "./assets/images/image_user_cyan.png",
        "david.d_almeida@etu.uca.fr",
        [
          Achievement("5 games"),
          Achievement("0 point"),
          Achievement("Win a game")
        ],
        [
          User(
              21,
              "Arthur",
              "./assets/images/image_user_cyan.png",
              "emre.kartal@etu.uca.fr",
              [
                Achievement("5 games"),
                Achievement("2 strikes in a row"),
                Achievement("Win a game")
              ],
              [],
              Stat(10, 2, 12, 110, 7, 6, 700, 58.33, 30.2)),
          User(
              22,
              "Louison",
              "./assets/images/image_user_cyan.png",
              "emre.kartal@etu.uca.fr",
              [
                Achievement("5 games"),
                Achievement("2 strikes in a row"),
                Achievement("Win a game")
              ],
              [],
              Stat(10, 2, 12, 150, 7, 6, 700, 58.33, 30.2)),
          User(
              23,
              "Owen",
              "./assets/images/image_user_cyan.png",
              "emre.kartal@etu.uca.fr",
              [
                Achievement("5 games"),
                Achievement("2 strikes in a row"),
                Achievement("Win a game")
              ],
              [],
              Stat(10, 2, 12, 10, 7, 6, 700, 58.33, 30.2)),
          User(
              24,
              "LULU",
              "./assets/images/image_user_cyan.png",
              "emre.kartal@etu.uca.fr",
              [
                Achievement("5 games"),
                Achievement("2 strikes in a row"),
                Achievement("Win a game")
              ],
              [],
              Stat(10, 2, 12, 40, 7, 6, 700, 58.33, 30.2)),
          User(
              25,
              "Raphael",
              "./assets/images/image_user_cyan.png",
              "emre.kartal@etu.uca.fr",
              [
                Achievement("5 games"),
                Achievement("2 strikes in a row"),
                Achievement("Win a game")
              ],
              [],
              Stat(10, 2, 12, 76, 7, 6, 700, 58.33, 30.2)),
        ],
        Stat(2, 7, 9, 80, 4, 3, 250, 27.77, 10.55))
  ];

  List<GameDetail> _gameDetails = [];
  void _initGameDetails() {
    gameDetails.add(GameDetail(1, DateTime.now(), players[7].id, 123, true,
        null, players[7].id, rounds, [players[0], players[1]]));
    gameDetails.add(GameDetail(2, DateTime.now(), players[0].id, 113, true,
        null, players[7].id, rounds, [players[0], players[1], players[7]]));
    gameDetails.add(GameDetail(3, DateTime.now(), players[7].id, 93, true, null,
        players[7].id, [], [players[0], players[7]]));
    gameDetails.add(GameDetail(4, DateTime.now(), players[7].id, 93, true, null,
        players[7].id, [], [players[1], players[7]]));
  }

  List<GameDetail> get gameDetails => _gameDetails;

  List<Round> _rounds = [];
  void _initRounds() {
    rounds.add(Round(4, 5, 9, players[1], gamePlayer));
    rounds.add(Round(4, 1, 5, players[8], gamePlayer));
    rounds.add(Round(4, 5, 9, players[7], gamePlayer));
    rounds.add(Round(4, 1, 5, players[1], gamePlayer));
    rounds.add(Round(4, 5, 9, players[7], gamePlayer));
    rounds.add(Round(1, 5, 6, players[8], gamePlayer));
    rounds.add(Round(4, 1, 5, players[7], gamePlayer));
    rounds.add(Round(1, 5, 6, players[8], gamePlayer));
    rounds.add(Round(4, 5, 9, players[7], gamePlayer));
    rounds.add(Round(9, 0, 9, players[8], gamePlayer));
    rounds.add(Round(4, 5, 9, players[7], gamePlayer));
    rounds.add(Round(4, 5, 9, players[8], gamePlayer));
    rounds.add(Round(4, 2, 6, players[0], gamePlayer));
    rounds.add(Round(3, 5, 8, players[1], gamePlayer));
    rounds.add(Round(4, 5, 9, players[2], gamePlayer));
    rounds.add(Round(4, 5, 9, players[4], gamePlayer));
    rounds.add(Round(1, 5, 6, players[6], gamePlayer));
    rounds.add(Round(4, 5, 9, players[8], gamePlayer));
    rounds.add(Round(4, 2, 6, players[7], gamePlayer));
    rounds.add(Round(3, 5, 8, players[8], gamePlayer));
    rounds.add(Round(4, 5, 9, players[7], gamePlayer));
    rounds.add(Round(4, 5, 9, players[8], gamePlayer));
    rounds.add(Round(1, 5, 6, players[7], gamePlayer));
    rounds.add(Round(4, 5, 9, players[8], gamePlayer));
    rounds.add(Round(4, 5, 9, players[7], gamePlayer));
    rounds.add(Round(4, 1, 5, players[8], gamePlayer));
  }

  List<Round> get rounds => _rounds;

  List<Game> _games = [];
  void _initGame() {
    games.add(Game(
        gameDetails[0].id,
        DateTime.now().subtract(Duration(days: 14)),
        123,
        true,
        [players[0].id, players[1].id]));
    games.add(Game(gameDetails[1].id, DateTime.now(), 101, true,
        [players[1].id, players[0].id]));
  }

  List<Game> get games => _games;
}
