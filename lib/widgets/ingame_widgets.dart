import 'package:bowl_in/widgets/scores_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InGameCardConfig extends StatefulWidget {
  const InGameCardConfig({Key? key}) : super(key: key);

  @override
  State<InGameCardConfig> createState() => _InGameCardConfigState();
}

class _InGameCardConfigState extends State<InGameCardConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 0, 30, 35),
      width: MediaQuery.of(context).size.width,
      height: 470,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/ingame_cardgame.png"),
              fit: BoxFit.fill),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Party code : ',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none)),
                    TextSpan(
                        text: '#172 520',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Color(0xffF40375),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none)),
                  ],
                ),
              )),
          ListUserInGame(),
          Spacer(),
          Image(
            image: AssetImage("assets/images/start_sentence.png"),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "+ Add a player",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shadowColor: Color(0xffB70056),
                  primary: Color(0xffF40375),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              )),
        ],
      ),
    );
  }
}

class ListUserInGame extends StatefulWidget {
  const ListUserInGame({Key? key}) : super(key: key);

  @override
  State<ListUserInGame> createState() => _ListUserInGameState();
}

class _ListUserInGameState extends State<ListUserInGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConstrainedBox(
                constraints: new BoxConstraints(
                  maxHeight: 170,
                ),
                child: ListView(children: [
                  UserInGame(),
                  UserInGame(),
                  UserInGame(),
                  UserInGame(),
                  UserInGame(),
                ])),
            Text(
              "3 player(s)",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: CupertinoColors.black,
                  decoration: TextDecoration.none),
            )
          ],
        ));
  }
}

class UserInGame extends StatefulWidget {
  const UserInGame({Key? key}) : super(key: key);

  @override
  State<UserInGame> createState() => _UserInGameState();
}

class _UserInGameState extends State<UserInGame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(0xffF2F2F2),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(70)),
              image: DecorationImage(
                  image: AssetImage("assets/images/image_user_cyan.png"),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Emre",
            style: GoogleFonts.roboto(
                fontSize: 18,
                decoration: TextDecoration.none,
                color: Color(0xff241E40)),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class InGameCardThrow extends StatefulWidget {
  const InGameCardThrow({Key? key}) : super(key: key);

  @override
  State<InGameCardThrow> createState() => _InGameCardThrowState();
}

class _InGameCardThrowState extends State<InGameCardThrow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(35, 0, 30, 35),
      width: MediaQuery.of(context).size.width,
      height: 470,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/ingame_cardgame.png"),
              fit: BoxFit.fill),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.15),
              blurRadius: 10.0,
              spreadRadius: 5.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Party code : ',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none)),
                    TextSpan(
                        text: '#172 520',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Color(0xffF40375),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
