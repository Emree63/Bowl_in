import 'dart:ui';

import 'package:bowl_in/widgets/profil_listpodium_widget.dart';
import 'package:bowl_in/widgets/scores_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalScoreBoard extends StatefulWidget {
  const FinalScoreBoard({Key? key}) : super(key: key);

  @override
  State<FinalScoreBoard> createState() => _FinalScoreBoardState();
}

class _FinalScoreBoardState extends State<FinalScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 35),
        width: double.infinity,
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 50),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'GAME OVER',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.none)),
                  ],
                ),
              )),
          Expanded(
              child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: PodiumGameOverWidget(
                  isfirst: 2,
                  pseudo: 'Lucas',
                  score: 123,
                ),
                top: 70,
                left: 30,
              ),
              Positioned(
                child: PodiumGameOverWidget(
                  isfirst: 1,
                  pseudo: 'Momo',
                  score: 160,
                ),
                top: 10,
              ),
              Positioned(
                child: PodiumGameOverWidget(
                  isfirst: 3,
                  pseudo: 'popo',
                  score: 110,
                ),
                top: 70,
                right: 30,
              )
            ],
          )),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/congrats_background.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Align(
              child: Text(
                "Play again",
                style: GoogleFonts.roboto(
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ]));
  }
}

class PodiumGameOverWidget extends StatelessWidget {
  final int isfirst;
  final String pseudo;
  final int score;
  const PodiumGameOverWidget(
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
                right: -30,
                child: Image.asset(
                  'assets/images/image_trophee.png',
                  height: 60,
                  width: 60,
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: Text(
            this.pseudo,
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                fontSize: 20),
          ),
        ),
        Text(
          this.score.toString(),
          style: GoogleFonts.roboto(
              color: Colors.pink,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              fontSize: this.isfirst == 1 ? 60 : 40,
              decoration: TextDecoration.none),
        ),
      ],
    );
  }
}

class InGameCardConfig extends StatefulWidget {
  const InGameCardConfig({Key? key}) : super(key: key);

  @override
  State<InGameCardConfig> createState() => _InGameCardConfigState();
}

class _InGameCardConfigState extends State<InGameCardConfig> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 35),
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
          Spacer(),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
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
  final int numberThrow;
  const InGameCardThrow({Key? key, required this.numberThrow})
      : super(key: key);

  @override
  State<InGameCardThrow> createState() => _InGameCardThrowState();
}

class _InGameCardThrowState extends State<InGameCardThrow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 30, 35),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Round ',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none)),
                    TextSpan(
                        text: '1 - 1st',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none)),
                    TextSpan(
                        text: ' Throw',
                        style: GoogleFonts.roboto(
                            fontSize: 15,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Round_picture(
                      pseudo: "Lucas",
                      image: "assets/images/image_user_red.png"),
                ],
              )),
          NumberPad(
            numberThrow: widget.numberThrow,
          ),
        ],
      ),
    );
  }
}

class Round_picture extends StatelessWidget {
  final String pseudo;
  final String image;
  const Round_picture({Key? key, required this.pseudo, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(70)),
          ),
        ),
        Text(
          pseudo,
          style: GoogleFonts.roboto(
              color: CupertinoColors.black,
              decoration: TextDecoration.none,
              fontSize: 30),
        ),
      ],
    );
  }
}

class StrikeButton extends StatelessWidget {
  final int currentSelected;
  final IntCallback onSonChanged;
  const StrikeButton(
      {Key? key, required this.onSonChanged, required this.currentSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSonChanged(10);
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/Strike_background.png"),
        )),
        child: Center(
            child: Text(
          "STRIKE !",
          style: GoogleFonts.roboto(
              color:
                  currentSelected == 10 ? Colors.pink : CupertinoColors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 40),
        )),
      ),
    );
  }
}

class SpareButton extends StatelessWidget {
  final int currentSelected;
  final IntCallback onSonChanged;
  const SpareButton(
      {Key? key, required this.onSonChanged, required this.currentSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSonChanged(10);
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/Spare_background.png"),
        )),
        child: Center(
            child: Text(
          "SPARE !",
          style: GoogleFonts.roboto(
              color:
                  currentSelected == 10 ? Colors.pink : CupertinoColors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 40),
        )),
      ),
    );
  }
}

class NumberPad extends StatefulWidget {
  final int numberThrow;
  const NumberPad({Key? key, required this.numberThrow}) : super(key: key);

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  int NumSelected = 100;

  void updateId(int newNum) {
    print(newNum);
    setState(() {
      NumSelected = newNum;
    });
  }

  void initState() {
    NumSelected = 100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Number(
                    currentSelected: NumSelected,
                    num: 1,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 2,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 3,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Number(
                    currentSelected: NumSelected,
                    num: 4,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 5,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 6,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Number(
                    currentSelected: NumSelected,
                    num: 7,
                    isSelectable: 1,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 8,
                    isSelectable: 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 9,
                    isSelectable: 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        widget.numberThrow == 1
            ? StrikeButton(
                currentSelected: NumSelected,
                onSonChanged: (int newId) {
                  updateId(newId);
                },
              )
            : SpareButton(
                currentSelected: NumSelected,
                onSonChanged: (int newId) {
                  updateId(newId);
                },
              )
      ],
    );
  }
}

typedef void IntCallback(int id);

class Number extends StatefulWidget {
  final int num;
  final int currentSelected;
  final int isSelectable;
  final IntCallback onSonChanged;
  const Number(
      {Key? key,
      required this.num,
      required this.isSelectable,
      required this.onSonChanged,
      required this.currentSelected})
      : super(key: key);

  @override
  State<Number> createState() => _NumberState();
}

class _NumberState extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return widget.isSelectable == 1
        ? GestureDetector(
            onTap: () {
              widget.onSonChanged(widget.num);
            },
            child: Text(
              widget.num.toString(),
              style: GoogleFonts.roboto(
                  color: widget.currentSelected == widget.num
                      ? Colors.pink
                      : Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w300,
                  fontSize: 50),
            ),
          )
        : Text(
            widget.num.toString(),
            style: GoogleFonts.roboto(
                color: Colors.grey,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w300,
                fontSize: 50),
          );
  }
}
