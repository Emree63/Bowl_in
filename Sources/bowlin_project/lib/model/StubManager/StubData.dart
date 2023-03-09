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

class StubData extends IManager {
  late IUserManager _userMgr;
  late IGameManager _gameMgr;

  StubData() {
    _userMgr = UserManager(this);
    _gameMgr = GameManager(this);
    _initRounds();
    _initGameDetails();
    _initGame();
    
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
        "https://fastly.picsum.photos/id/1060/2000/2000.jpg?hmac=_RrU8GpkCDUlVKfgyWE-GcX-GS5TKNyUzdFbJAGXHV4",
        "emre.kartal@etu.uca.fr",
        [
          Achievement("5 games"),
          Achievement("2 strikes in a row"),
          Achievement("Win a game")
        ],
        [],
        Stat(10, 2, 12, 130, 7, 6, 700, 58.33, 30.2)
      ),
    User(
        9,
        "Dave",
        "https://fastly.picsum.photos/id/820/2000/2000.jpg?hmac=Ctxx2feJNZnG1S7UPx_YrWcEw89tKb7fR8i1W-VTOz4",
        "david.d_almeida@etu.uca.fr",
        [
          Achievement("5 games"),
          Achievement("0 point"),
          Achievement("Win a game")
        ],
        [],
        Stat(2, 7, 9, 80, 4, 3, 250, 27.77, 10.55)
        )
  ];

  List<GameDetail> _gameDetails = [];
  void _initGameDetails() {
    gameDetails.add(GameDetail(1, DateTime.now(), players[7].id, 123, true,
        null, players[7].id, rounds, [players[0], players[1]]));
    gameDetails.add(GameDetail(2, DateTime.now(), players[8].id, 113, true,
        null, players[8].id, rounds, [players[0], players[1], players[2]]));
  }

  List<GameDetail> get gameDetails => _gameDetails;

  List<Round> _rounds = [];
  void _initRounds() {
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(4, 1, 5, players[8]));
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(4, 1, 5, players[8]));
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(1, 5, 6, players[8]));
    rounds.add(Round(4, 1, 5, players[7]));
    rounds.add(Round(1, 5, 6, players[8]));
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(9, 0, 9, players[8]));
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(4, 5, 9, players[8]));
    rounds.add(Round(4, 2, 6, players[7]));
    rounds.add(Round(3, 5, 8, players[8]));
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(4, 5, 9, players[8]));
    rounds.add(Round(1, 5, 6, players[7]));
    rounds.add(Round(4, 5, 9, players[8]));
    rounds.add(Round(4, 5, 9, players[7]));
    rounds.add(Round(4, 1, 5, players[8]));
  }
    
  List<Round> get rounds => _rounds;

  List<Game> _games = [];
  void _initGame() {
    games.add(Game(gameDetails[0].id, DateTime.now(), 123, true, []));
    games.add(Game(gameDetails[1].id, DateTime.now(), 101, true, []));
  }
  
  List<Game> get games => _games;
}
