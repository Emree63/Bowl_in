library StubLib;

import 'package:bowl_in/model/Game.dart';

import '../IManager.dart';
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
import 'package:uuid/uuid.dart';

class StubData extends IManager {
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  StubData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
    _initRounds();
    _initGameDetails();
    _initGame();
    users[1].games = games;
    userCurrent = users[1];
  }

  List<Player> players = [
    Player(Uuid(), "Mathieu", "./assets/images/image_user_cyan.png"),
    Player(Uuid(), "Robin", "./assets/images/image_user_purple.png"),
    Player(Uuid(), "Lucas", "./assets/images/image_user_red.png"),
    Player(Uuid(), "Emre", "./assets/images/image_user_blue.png"),
    Player(Uuid(), "Louison", "./assets/images/image_user_cyan.png"),
    Player(Uuid(), "Arthur", "./assets/images/image_user_yellow.png"),
    Player(Uuid(), "David", "./assets/images/image_user_pink.png"),
  ];

  List<User> users = [
    User(
        Uuid(),
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
        Uuid(),
        "Dave",
        "./assets/images/image_user_cyan.png",
        "david.d_almeida@etu.uca.fr",
        [
          Achievement("5 games"),
          Achievement("0 point"),
          Achievement("Win a game")
        ],
        [],
        Stat(2, 7, 9, 80, 4, 3, 250, 27.77, 10.55))
  ];

  List<GameDetail> gameDetails = [];
  void _initGameDetails() {
    var uui = Uuid();
    gameDetails.add(GameDetail(Uuid(), DateTime.now(), users[0].id, 123, true,
        null, users[0].id, rounds, [players[0], players[1]]));
    gameDetails.add(GameDetail(Uuid(), DateTime.now(), users[1].id, 113, true,
        null, users[1].id, rounds, [players[0], players[1]]));
  }

  List<Round> rounds = [];
  void _initRounds() {
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(4, 1, 5, users[1]));
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(4, 1, 5, users[1]));
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(1, 5, 6, users[1]));
    rounds.add(Round(4, 1, 5, users[0]));
    rounds.add(Round(1, 5, 6, users[1]));
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(9, 0, 9, users[1]));
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(4, 5, 9, users[1]));
    rounds.add(Round(4, 2, 6, users[0]));
    rounds.add(Round(3, 5, 8, users[1]));
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(4, 5, 9, users[1]));
    rounds.add(Round(1, 5, 6, users[0]));
    rounds.add(Round(4, 5, 9, users[1]));
    rounds.add(Round(4, 5, 9, users[0]));
    rounds.add(Round(4, 1, 5, users[1]));
  }

  List<Game> games = [];
  void _initGame() {
    games.add(Game(gameDetails[0].id,
        DateTime.now().subtract(Duration(days: 14)), 123, true, []));
    games.add(Game(gameDetails[1].id, DateTime.now(), 101, true, []));
  }
}
