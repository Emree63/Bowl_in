import 'package:bowl_in/model/ApiManager/ApiManager.dart';
import 'package:bowl_in/model/ApiManager/AuthService.dart';
import 'package:bowl_in/model/ApiManager/responceFactory/UserFactory.dart';
import 'package:bowl_in/model/Player.dart';

import 'package:bowl_in/model/User.dart';

import '../IAuthManager.dart';
import '../IUserManager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService extends IUserManager {
  var url = Uri.parse('https://localhost:8443/users');

  late IAuthManager _authMgr;
  final ApiManager parent;

  UserService(this.parent) : super(AuthService(parent)){
    _initUser();
  }

  _initUser() async {
    try {
      var user = await getUserById(parent.userId);
      parent.userCurrent = user;
    }catch(error){
      User user2 = User(0, "Unknown", "./assets/images/image_user_pink.png", "", [], []);
      parent.userCurrent = user2;
    }

  }

  @override
  List<User> getRankingWithFriends() {
    // TODO: implement getRankingWithFriends
    List<User> sortedPlayers = List.from(parent.userCurrent.friends);
    sortedPlayers.sort((a, b) => b.stat.highscore.compareTo(a.stat.highscore));
    return sortedPlayers;
  }

  @override
  Future<User> getUserById(int id) async {
    try{
      var response = await parent.httpClient.get(Uri.parse('${url}/$id'));
      if (response.statusCode == 200){
        var decodedResponse = jsonDecode(response.body);
        print(decodedResponse);
        return UserFactory.toModel(decodedResponse);
      }
      else{
        print('Error occurred while fetching user by ID isint 200 ');
        throw Exception('Http failded but not implented');
      }
    }catch(error){
      print('Error occurred while fetching user by ID: $error');
      throw Exception('Http failded but not implented');;
    }

  }

  @override
  Future<List<Player>> getUsersByName(String name) async {
    // TODO: implement getUsersByName
    throw UnimplementedError();

  }

  @override
  saveUser(User user) async {
    var response = await parent.httpClient.post(url, body : UserFactory.toJson(user));

  }
}
