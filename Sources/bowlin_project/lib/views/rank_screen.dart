import 'package:bowl_in/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';
import '../widgets/profil_listpodium_widget.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  List<User> rank = MyApp.controller.userMgr.getRankingWithFriends();
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff19BDE0),
            Color(0xff4A17DC),
          ],
        )),
      ),
      Align(
        alignment: AlignmentDirectional.topCenter,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/image_ranking.png"),
          )),
          child: Center(
              child: Text(
            "Ranking",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )),
        ),
      ),
      Positioned(
          top: 70,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/image_podium(1).png"),
                )),
              )
            ],
          )),
      Positioned(
          left: 65,
          top: MediaQuery.of(context).size.height * 0.195,
          child: ProfilPodiumWidget(
              isfirst: 0, pseudo: rank[1].name, score: rank[1].stat.highscore)),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.114,
          child: Align(
            child: ProfilPodiumWidget(
                isfirst: 1,
                pseudo: rank[0].name,
                score: rank[0].stat.highscore),
          )),
      Positioned(
        right: 65,
        top: MediaQuery.of(context).size.height * 0.219,
        child: ProfilPodiumWidget(
            isfirst: 0, pseudo: rank[2].name, score: rank[2].stat.highscore),
      ),
      Positioned(
          bottom: -40,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/image_podium.png"),
                )),
                child: rank.length > 3 ? ListPodium() : Container(),
              )
            ],
          )),
    ]);
  }
}
