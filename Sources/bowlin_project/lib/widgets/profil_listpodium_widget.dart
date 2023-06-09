import 'package:bowl_in/widgets/scores_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import '../model/User.dart';

class ProfilPodiumWidget extends StatelessWidget {
  final int isfirst;
  final String pseudo;
  final int score;
  const ProfilPodiumWidget(
      {Key? key,
      required this.isfirst,
      required this.pseudo,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: this.isfirst == 1 ? 65 : 50,
              height: this.isfirst == 1 ? 65 : 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image_user_red.png"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(70)),
              ),
            ),
            if (isfirst == 1)
              Positioned(
                bottom: -5,
                right: -15,
                child: Image.asset(
                  'assets/images/image_trophee.png',
                  height: 40,
                  width: 40,
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
          child: Text(
            this.pseudo,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: Color(0xff3618A0),
              borderRadius: BorderRadius.all(Radius.circular(70)),
            ),
            child: Center(
              child: Text(
                this.score.toString() + " pts",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )),
      ],
    );
  }
}

class ProfilListWidget extends StatelessWidget {
  final int position;
  final String pseudo;
  final int score;

  const ProfilListWidget(
      {Key? key,
      required this.position,
      required this.pseudo,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
      child: Container(
        width: 300,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Text(
                this.position.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xffBABABA),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(70)),
                image: DecorationImage(
                    image: AssetImage("assets/images/image_user_cyan.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.pseudo,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff585858)),
                  ),
                  Text(
                    this.score.toString() + " points",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffBABABA)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPodium extends StatelessWidget {
  const ListPodium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> rank = MyApp.controller.userMgr.getRankingWithFriends();
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: SizedBox(
            height: 500,
            child: ScrollConfiguration(
              behavior: CustomScroll(),
              child: ListView.builder(
                itemCount: rank.length - 3,
                itemBuilder: (BuildContext context, int index) {
                  return ProfilListWidget(
                    position: 4 + index,
                    pseudo: rank[index + 3].name,
                    score: rank[index + 3].stat.highscore,
                  );
                },
              ),
            )));
  }
}
