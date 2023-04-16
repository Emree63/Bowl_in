import 'dart:convert';

import 'package:bowl_in/model/ApiManager/responceFactory/GameFactory.dart';
import 'package:bowl_in/model/ApiManager/responceFactory/UserFactory.dart';

import '../GameDetail.dart';
import '../IGameManager.dart';
import '../Player.dart';
import '../User.dart';
import 'ApiManager.dart';

class GameService extends IGameManager {

  var url = Uri.parse('http:localhost:8080/games');

  final ApiManager parent;

  // Constructor
  GameService(this.parent){
    _initGame();
  }

  _initGame() async {
    parent.gameDetails = await parent.database.readGameDetail();
  }

  // Methods
  @override
  Future<GameDetail> getGameById(int id) async {
    try{
      var response = await parent.httpClient.get(Uri.parse('${url}/$id'));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body);
        return GameFactory.toModel(decodedResponse);
      }
      else{
        print('Error occurred while fetching count isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching count for game: $error');
      throw Exception('Http failded but not implented');;
    }
  }


  @override
  Future<List<GameDetail>> getGamesByPlayerId(int id) async {
    return _getGames(id);
  }

  Future<List<GameDetail>> _getGames(dynamic player) async {
    // Récupérer l'ID du joueur si un joueur a été passé en paramètre
    int playerId = player is User ? player.id : player;

    // Effectuer l'appel API pour récupérer les détails des jeux pour ce joueur
    var response = await parent.httpClient.get(Uri.parse('${url}/$playerId/players'));

    if (response.statusCode == 200) {
      // Décoder la réponse JSON en une liste de détails de jeu
      var decodedResponse = jsonDecode(response.body) as List<dynamic>;
      return decodedResponse.map((game) => GameDetail.fromJson(game)).toList();
    } else {
      throw Exception('Failed to retrieve game details');
    }
    var response = await parent.httpClient.get(Uri.parse('${url}/$id/players'));
    if (response.statusCode == 200){
      var decodedResponse = jsonDecode(response.body);
      return decodedResponse;
    }
  }

  @override
  Future<List<GameDetail>> getGamesByPlayer(Player user) async  {
    return _getGames(user);
  }

  @override
  Future<List<GameDetail>> getGamesByPlayers(List<Player> users) async {
    List<GameDetail> games = [];
    List<String> playerIds = users.map((player) => player.name).toList();

    try{
      var response = await parent.httpClient.get(Uri.parse('${url}/$id/players'));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse;
      }
      else{
        print('Error occurred while fetching count isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching count for game: $error');
      throw Exception('Http failded but not implented');;
    }
  }


  @override
  Future<List<Player>> getPlayersByIdGame(int id) async {
    try{
      var response = await parent.httpClient.get(Uri.parse('${url}/$id/players'));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body) as List<dynamic>;
        List<Player> players = decodedResponse
            .map((userJson) => UserFactory.toModel(userJson))
            .toList();
        return players;
      }
      else{
        print('Error occurred while fetching count isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching count for game: $error');
      throw Exception('Http failded but not implented');;
    }
  }

  @override
  Future<Map<Player, int>> getRankByIdGame(int id) async {
    try{
      var response = await parent.httpClient.get(Uri.parse('${url}/$id/rank'));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse;
      }
      else{
        print('Error occurred while fetching count isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching count for game: $error');
      throw Exception('Http failded but not implented');;
    }
  }

  @override
  addGame(GameDetail gd) async {
    try{
      var response = await parent.httpClient.post(url, body : GameFactory.toJson(gd));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body);
        return ;
      }
      else{
        print('Error occurred while fetching count isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching count for game: $error');
      throw Exception('Http failded but not implented');;
    }
  }

/*
  Future<void> createGame(User user) async {
    final db = await instance.database;

    await db.transaction((txn) async {
      for (var game in user.games) {
        await txn.insert(tableGame, GameMapper.toJson(game, user));
      }
    });
  }
  Future<void> createGameDetail(GameDetail gameDetail) async {
    final db = await instance.database;

    await db.transaction((txn) async {
      await txn.insert(tableGameDetail, GameDetailMapper.toJson(gameDetail));
    });
  }*/

  @override
  getNextId() async {
    try{
      var response = await parent.httpClient.get(Uri.parse('${url}/count'));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body);
        return decodedResponse;
      }
      else{
        print('Error occurred while fetching count isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching count for game: $error');
      throw Exception('Http failded but not implented');;
    }
  }
}
