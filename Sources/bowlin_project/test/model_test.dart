import '../lib/model/Player.dart';
import '../lib/model/Guest.dart';
import '../lib/model/User.dart';
import '../lib/model/Stat.dart';
import 'dart:math';
import '../lib/model/Achievement.dart';
import 'package:uuid/uuid.dart';

void main() {
  List<Stat> stats = [];
  Random random = new Random();

  for (int i = 0; i < 10; i++) {
    Stat stat = new Stat(
      random.nextInt(50) + 1,  // valeur aléatoire entre 1 et 50 
      random.nextInt(20) + 1,  // valeur aléatoire entre 1 et 20 
      random.nextInt(30) + 1,  // valeur aléatoire entre 1 et 30 
      random.nextInt(1000) + 1,  // valeur aléatoire entre 1 et 1000 
      random.nextInt(10) + 1,  // valeur aléatoire entre 1 et 10 
      random.nextInt(5) + 1,  // valeur aléatoire entre 1 et 5 
      random.nextInt(5000) + 1000,  // valeur aléatoire entre 1000 et 6000 
      random.nextInt(300) + 1,  // valeur aléatoire entre 1 et 300 
      random.nextDouble() * 10  // valeur aléatoire entre 0 et 10 
    );
    stats.add(stat);
  }

  User ami = new User(Uuid(), "Lucas","https://fastly.picsum.photos/id/288/2000/2000.jpg?hmac=AUboE-jzAzofYj_O3w_EqtZU3JHzcg7HR1IQd1Ce7lY","Lucas.delanier@etu.uca.fr",[],[],[]);

  List<Player> players = [
    new Player(Uuid(), "Rami", "https://fastly.picsum.photos/id/1060/2000/2000.jpg?hmac=_RrU8GpkCDUlVKfgyWE-GcX-GS5TKNyUzdFbJAGXHV4"),
    new Player(Uuid(), "Emre", "https://fastly.picsum.photos/id/670/2000/2000.jpg?hmac=zWqTr_vDEab3dBtp7JZgJP8TRCPNanJ4tYwDDd-jGYA"),
    new Guest(Uuid(), "Bot1","https://fastly.picsum.photos/id/820/2000/2000.jpg?hmac=Ctxx2feJNZnG1S7UPx_YrWcEw89tKb7fR8i1W-VTOz4"),
    new Guest(Uuid(), "Bot2","https://fastly.picsum.photos/id/288/2000/2000.jpg?hmac=AUboE-jzAzofYj_O3w_EqtZU3JHzcg7HR1IQd1Ce7lY"),
    ami,
    new User(
      Uuid(), 
      "Louison",
      "https://fastly.picsum.photos/id/1029/2000/2000.jpg?hmac=_K3pMobVk00dfNR7rsj1NLnEBB5Gf88SvGPbbjoH-Uc",
      "louison.parant@etu.uca.fr",
      [
        new Achievement("5 games"),
        new Achievement("2 strikes in a row"),
        new Achievement("Win a game")
      ],
      [
        ami
      ],
      stats
      )
  ];


  print("Players :");
  // afficahge de toutes les informations de tous les joueurs 
  for (var player in players) {
    if (player is Guest) {
      print("\tID: ${player.id}, Nom: ${player.name}, Image: ${player.image}, Type: Guest");
    } else if (player is User) {
      print("\tID: ${player.id}, Nom: ${player.name}, Image: ${player.image}, Type: User");
      print("\tAchievements:");
      for (var achievement in player.achievements) {
        print("\t\tNom: ${achievement.name}");
      }
      print("\tStats:");
      for (var stat in player.stats) {
        print("\t\tVictoires: ${stat.nbVictory}, Défaites: ${stat.nbDefeat}, Parties jouées: ${stat.nbGames}, Meilleur score: ${stat.highscore}, Nombre de strikes: ${stat.nbStrikes}, Nom de spares: ${stat.nbStrikes}, Moyenne score: ${stat.avgScore}, Moyenne score par round: ${stat.avgPinsPerRound}");
      }
      print("\tAmis:");
      for (var amis in player.friends) {
        print("\t\tNom: ${amis.name}, Mail: ${amis.mail}");
      }
      
    } else {
      print("\tID: ${player.id}, Nom: ${player.name}, Image: ${player.image}, Type: Player");
    }
  }

  //GameDetail
  
  List<GameDetail> games = [ 
    new GameDetail(Uuid(), DateTime.now(), players[0].id, 290, true, null, players[0], [ new Round(10,null,10, players[0]), new Round(5,2,7, players[1]), new Round(5,2,7, players[1]), new Round(5,1,12,players[0])], [players[0],players[1]] ),
    new GameDetail(Uuid(), DateTime.now().subtract(Duration(days: 2)), players[1].id, 250, true, null, players[1], [ new Round(7,null,7, players[1]), new Round(3,3,9, players[0]), new Round(5,2,7, players[1]), new Round(5,1,12,players[0])], [players[0],players[1]] ),
    new GameDetail(Uuid(), DateTime.now().subtract(Duration(days: 4)), players[2].id, 210, false, players[1].id, players[2], [ new Round(8,2,10, players[2]), new Round(6,2,8, players[1]), new Round(4,2,6, players[2]), new Round(2,2,4,players[1])], [players[1],players[2]] ),
    new GameDetail(Uuid(), DateTime.now().subtract(Duration(days: 7)), players[3].id, 300, false, players[2].id, players[3], [ new Round(12,null,12, players[3]), new Round(7,3,10, players[2]), new Round(6,2,8, players[1]), new Round(5,1,12,players[0])], [players[0],players[1],players[2],players[3]] ),
    new GameDetail(Uuid(), DateTime.now().subtract(Duration(days: 10)), players[4].id, 280, true, null, players[4], [ new Round(9,1,10, players[4]), new Round(7,3,10, players[2]), new Round(8,2,10, players[3]), new Round(5,2,7,players[1])], [players[1],players[2],players[3],players[4]] ),
    new GameDetail(Uuid(), DateTime.now().subtract(Duration(days: 12)), players[1].id, 240, false, players[4].id, players[1], [ new Round(7,null,7, players[1]), new Round(5,2,7, players[2]), new Round(6,2,8, players[1]), new Round(5,1,12,players[0])], [players[0],players[1],players[2],players[4]] ),
    new GameDetail(Uuid(), DateTime.now().subtract(Duration(days: 15)), players[2].id, 200, true, null, players[2], [ new Round(8,2,10, players[2]), new Round(4,2,6, players[1]), new Round(7,3,10, players[3]), new Round(5,2,7,players[0])], [players[0],players[1],players[2],players[3]] )
  ]

  print("GameDetail :");
  for (var game in games) {
  print("Game ID: ${game.id}");
  print("Time: ${game.time}");
  print("Winner: ${game.winner}");
  print("Number of Points: ${game.nbPoints}");
  print("Is Finished: ${game.isFinished}");
  print("Current Round: ${game.currentRound}");
  print("Host: ${game.host}");

  print("Rounds:");
  for (var round in game.rounds) {
    print("Round Score: ${round.score}");
    print("Round Bonus: ${round.bonus}");
    print("Round Total: ${round.total}");
    print("Round Player: ${round.player}");
  }

  print("Players:");
  for (var player in game.players) {
    print("Player ID: ${player.id}");
    print("Player Name: ${player.name}");
    print("Player Score: ${player.score}");
  }

  print("----------------------------");
}


}
