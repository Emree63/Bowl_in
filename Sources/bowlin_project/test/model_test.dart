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
  

  print("GameDetail :");


}
