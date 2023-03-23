// import 'package:bowl_in/model/GamePlayer.dart';
//
// import '../lib/model/Player.dart';
// import '../lib/model/Guest.dart';
// import '../lib/model/User.dart';
// import '../lib/model/Stat.dart';
// import '../lib/model/Round.dart';
// import '../lib/model/GameDetail.dart';
// import '../lib/model/StubManager/StubData.dart';
// import '../lib/model/IManager.dart';
// import 'dart:math';
// import '../lib/model/Achievement.dart';
//
// void main() {
//   List<Stat> stats = [];
//   Random random = Random();
//
//   for (int i = 0; i < 10; i++) {
//     Stat stat = Stat(
//         random.nextInt(50) + 1, // valeur aléatoire entre 1 et 50
//         random.nextInt(20) + 1, // valeur aléatoire entre 1 et 20
//         random.nextInt(30) + 1, // valeur aléatoire entre 1 et 30
//         random.nextInt(1000) + 1, // valeur aléatoire entre 1 et 1000
//         random.nextInt(10) + 1, // valeur aléatoire entre 1 et 10
//         random.nextInt(5) + 1, // valeur aléatoire entre 1 et 5
//         random.nextInt(5000) + 1000, // valeur aléatoire entre 1000 et 6000
//         random.nextInt(300) + 1, // valeur aléatoire entre 1 et 300
//         random.nextDouble() * 10 // valeur aléatoire entre 0 et 10
//         );
//     stats.add(stat);
//   }
//
//   print("Stats:");
//   for (var stat in stats) {
//     print(
//         "\tVictoires: ${stat.nbVictory}, Défaites: ${stat.nbDefeat}, Parties jouées: ${stat.nbGames}, Meilleur score: ${stat.highscore}, Nombre de strikes: ${stat.nbStrikes}, Nom de spares: ${stat.nbStrikes}, Moyenne score: ${stat.avgScore}, Moyenne score par round: ${stat.avgPinsPerRound}");
//   }
//
//   User ami = User(
//       5,
//       "Lucas",
//       "https://fastly.picsum.photos/id/288/2000/2000.jpg?hmac=AUboE-jzAzofYj_O3w_EqtZU3JHzcg7HR1IQd1Ce7lY",
//       "Lucas.delanier@etu.uca.fr",
//       [],
//       [],
//       stats[1]);
//
//   List<Player> players = [
//     Player(1, "Rami",
//         "https://fastly.picsum.photos/id/1060/2000/2000.jpg?hmac=_RrU8GpkCDUlVKfgyWE-GcX-GS5TKNyUzdFbJAGXHV4"),
//     Player(2, "Emre",
//         "https://fastly.picsum.photos/id/670/2000/2000.jpg?hmac=zWqTr_vDEab3dBtp7JZgJP8TRCPNanJ4tYwDDd-jGYA"),
//     Guest(3, "Bot1",
//         "https://fastly.picsum.photos/id/820/2000/2000.jpg?hmac=Ctxx2feJNZnG1S7UPx_YrWcEw89tKb7fR8i1W-VTOz4"),
//     Guest(4, "Bot2",
//         "https://fastly.picsum.photos/id/288/2000/2000.jpg?hmac=AUboE-jzAzofYj_O3w_EqtZU3JHzcg7HR1IQd1Ce7lY"),
//     ami,
//     User(
//         6,
//         "Louison",
//         "https://fastly.picsum.photos/id/1029/2000/2000.jpg?hmac=_K3pMobVk00dfNR7rsj1NLnEBB5Gf88SvGPbbjoH-Uc",
//         "louison.parant@etu.uca.fr",
//         [
//           Achievement("5 games"),
//           Achievement("2 strikes in a row"),
//           Achievement("Win a game")
//         ],
//         [ami],
//         stats[0])
//   ];
//
//   print("Players :");
//   // afficahge de toutes les informations de tous les joueurs
//   for (var player in players) {
//     displayPlayer(player,1);
//   }
//
//   //GameDetail
//
//
//   List<GameDetail> games = [];
//   games.add(GameDetail(
//         1, DateTime.now(), players[0].id, 290, true, null, players[0].id)
//       , [
//       Round(10, null, 10, players[0], ),
//       Round(5, 2, 7, players[1]),
//       Round(5, 1, 12, players[0]),
//       Round(5, 2, 7, players[1]),
//     ], [
//       players[0],
//       players[1]
//     ]),
//     GameDetail(2, DateTime.now().subtract(Duration(days: 2)),
//         players[1].id, 250, true, null, players[1].id, [
//       Round(7, null, 7, players[1]),
//       Round(3, 3, 9, players[0]),
//       Round(5, 2, 7, players[1]),
//       Round(5, 1, 12, players[0])
//     ], [
//       players[0],
//       players[1]
//     ]),
//     GameDetail(3, DateTime.now().subtract(Duration(days: 4)),
//         players[2].id, 210, false, null, players[2].id, [
//       Round(8, 2, 10, players[2]),
//       Round(6, 2, 8, players[1]),
//       Round(4, 2, 6, players[2]),
//       Round(2, 2, 4, players[1])
//     ], [
//       players[1],
//       players[2]
//     ]),
//     GameDetail(
//       4,
//       DateTime.now().subtract(Duration(days: 7)),
//       players[3].id,
//       120,
//       true,
//       Round(12, null, 12, players[3]),
//       players[3].id, [
//       Round(12, null, 12, players[3]),
//       Round(7, 3, 10, players[2]),
//       Round(6, 2, 8, players[1]),
//       Round(5, 1, 12, players[0])
//     ], [
//       players[0],
//       players[1],
//       players[2],
//       players[3]
//     ]),
//     GameDetail(5, DateTime.now().subtract(Duration(days: 10)),
//         players[4].id, 280, true, null, players[4].id, [
//       Round(9, 1, 10, players[4]),
//       Round(7, 3, 10, players[2]),
//       Round(8, 2, 10, players[3]),
//       Round(5, 2, 7, players[1])
//     ], [
//       players[1],
//       players[2],
//       players[3],
//       players[4]
//     ]),
//     GameDetail(6, DateTime.now().subtract(Duration(days: 12)),
//       players[1].id, 240, true, null, players[1].id, [
//       Round(7, null, 7, players[1]),
//       Round(5, 2, 7, players[2]),
//       Round(6, 2, 8, players[1]),
//       Round(5, 1, 12, players[0])
//     ], [
//       players[0],
//       players[1],
//       players[2],
//       players[4]
//     ]),
//     GameDetail(7, DateTime.now().subtract(Duration(days: 15)),
//         players[2].id, 200, true, null, players[2].id, [
//       Round(8, 2, 10, players[2]),
//       Round(4, 2, 6, players[1]),
//       Round(7, 3, 10, players[3]),
//       Round(5, 2, 7, players[0])
//     ], [
//       players[0],
//       players[1],
//       players[2],
//       players[3]
//     ])
//   ];
//
//   print("GameDetail :");
//   for (var game in games) {
//     displayGameDetail(game,1);
//     print("\t-----------------------------------------");
//   }
//
//   print("StubManager:");
//   IManager mgr = new StubData();
//
//   print("\tGameManager:");
//
//   print("\tgetGameById function with id: 2");
//   GameDetail gd = mgr.gameMgr.getGameById(2);
//   displayGameDetail(gd,2);
//
//   print("\tgetGamesByPlayerId function with id: 2");
//   List<GameDetail> gds = mgr.gameMgr.getGamesByPlayerId(8);
//   for (var game in gds)
//   {
//     displayGameDetail(game,2);
//   }
//
//   print("\tgetGamesByPlayer function:");
//   var player = mgr.userMgr.getUserById(8);
//   List<GameDetail> gdsPlayer = mgr.gameMgr.getGamesByPlayer(player);
//   for (var game in gdsPlayer)
//   {
//     displayGameDetail(game,2);
//   }
//
//   print("\tgetGamesByPlayers:");
//   var player2 = mgr.userMgr.getUserById(2);
//   List<Player> playersTest = [player,player2];
//   List<GameDetail> gdsPlayers = mgr.gameMgr.getGamesByPlayers(playersTest);
//   for (var game in gdsPlayers)
//   {
//     displayGameDetail(game,2);
//   }
//
//   print("\tgetPlayersByIdGame:");
//   var playersIntoGame = mgr.gameMgr.getPlayersByIdGame(2);
//   for (var player in playersIntoGame)
//   {
//     displayPlayer(player,2);
//   }
//
//   print("\tgetRankByIdGame:");
//   var ranksPlayers = mgr.gameMgr.getRankByIdGame(2);
//   ranksPlayers.forEach((id, rank) {
//     displayPlayer(mgr.userMgr.getUserById(id),2);
//     print('\t\tRank $rank');
//   });
// }
//
// void displayGameDetail(GameDetail gd, int numTabs)
// {
//   String tabs = '\t' * numTabs;
//   print(tabs+"Game ID: ${gd.id}");
//   print(tabs+"Time: ${gd.time}");
//   print(tabs+"Winner: ${gd.winner}");
//   print(tabs+"Number of Points: ${gd.nbPoints}");
//   print(tabs+"Is Finished: ${gd.isFinished}");
//   print(tabs+"Current Round: ${gd.currentRound}");
//   print(tabs+"Host: ${gd.host}");
//   print(tabs+"Rank: ${gd.getRank()}");
//   print(tabs+"Rounds:");
//   for (var round in gd.rounds) {
//     displayRound(round, numTabs+1);
//   }
//   print(tabs+"Players:");
//   for (var player in gd.players) {
//     displayPlayer(player, numTabs+1);
//   }
// }
//
// void displayRound(Round round, int numTabs)
// {
//   String tabs = '\t' * numTabs;
//   print(tabs+"Round Score: ${round.firstThrow}");
//   print(tabs+"Round Bonus: ${round.secondThrow}");
//   print(tabs+"Round Total: ${round.points}");
//   print(tabs+"Round Player: ${round.player.name}");
// }
//
// void displayPlayer(Player player, int numTabs)
// {
//   String tabs = '\t' * numTabs;
//   if (player is Guest) {
//     print(tabs+"ID: ${player.id}, Nom: ${player.name}, Image: ${player.image}, Type: Guest");
//   } else if (player is User) {
//     print(tabs+"ID: ${player.id}, Nom: ${player.name}, Image: ${player.image}, Type: User");
//     print(tabs+"Achievements:");
//     for (var achievement in player.achievements) {
//       displayAchievement(achievement, numTabs+1);
//     }
//     print(tabs+"Amis:");
//     for (var amis in player.friends) {
//       print("\t\tNom: ${amis.name}, Mail: ${amis.mail}");
//     }
//     print(tabs+"Victoires: ${player.stat.nbVictory}, Défaites: ${player.stat.nbDefeat}, Parties jouées: ${player.stat.nbGames}, Meilleur score: ${player.stat.highscore}, Nombre de strikes: ${player.stat.nbStrikes}, Nom de spares: ${player.stat.nbStrikes}, Moyenne score: ${player.stat.avgScore}, Moyenne score par round: ${player.stat.avgPinsPerRound}");
//   } else {
//     print(tabs+"ID: ${player.id}, Nom: ${player.name}, Image: ${player.image}, Type: Player");
//   }
// }
//
// void displayAchievement(Achievement achievement, int numTabs)
// {
//   String tabs = '\t' * numTabs;
//   print(tabs+"Nom: ${achievement.name}");
// }