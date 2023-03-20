import 'dart:ui';

import 'package:bowl_in/main.dart';
import 'package:bowl_in/widgets/profil_listpodium_widget.dart';
import 'package:bowl_in/widgets/scores_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/AbstractRound.dart';
import '../model/GameDetail.dart';
import '../model/Guest.dart';
import '../model/Player.dart';

class FinalScoreBoard extends StatefulWidget {
  final GameDetail gameDeatil;
  const FinalScoreBoard({Key? key, required this.gameDeatil}) : super(key: key);

  @override
  State<FinalScoreBoard> createState() => _FinalScoreBoardState();
}

class _FinalScoreBoardState extends State<FinalScoreBoard> {
  late Map<Player, int> rank;
  late List<Player> pseudoList;
  late List<int> scoreList;
  @override
  void initState() {
    rank = widget.gameDeatil.getRank();
    pseudoList = rank.keys.toList();
    scoreList = rank.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          rank.length > 1
                              ? Positioned(
                                  child: PodiumGameOverWidget(
                                    isfirst: 2,
                                    player: pseudoList[1],
                                    score: scoreList[1],
                                  ),
                                  top: 70,
                                  left: 30,
                                )
                              : Container(),
                          rank.length > 0
                              ? Positioned(
                                  child: PodiumGameOverWidget(
                                    isfirst: 1,
                                    player: pseudoList[0],
                                    score: scoreList[0],
                                  ),
                                  top: 10,
                                )
                              : Container(),
                          rank.length > 2
                              ? Positioned(
                                  child: PodiumGameOverWidget(
                                    isfirst: 3,
                                    player: pseudoList[2],
                                    score: scoreList[2],
                                  ),
                                  top: 70,
                                  right: 30,
                                )
                              : Container()
                        ],
                      )),
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/congrats_background.png"),
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
                    ])),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: Text(
                "LEAVE",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xff1ABAE0)),
              ),
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  width: 7,
                  color: Color(0xff1ABAE0),
                ),
                onPrimary: Colors.transparent,
                primary: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(55),
                ),
                minimumSize: Size(200, 80),
              ),
            ),
            Spacer(),
          ],
        )
      ],
    );
  }
}

class PodiumGameOverWidget extends StatelessWidget {
  final int isfirst;
  final Player player;
  final int score;
  const PodiumGameOverWidget(
      {Key? key,
      required this.isfirst,
      required this.player,
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
                    image: AssetImage(player.image), fit: BoxFit.cover),
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
            this.player.name,
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
  late List<Player> listPlayer;
  @override
  void initState() {
    listPlayer = [MyApp.controller.userCurrent];
    super.initState();
  }

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
          ListUserInGame(listPlayer: listPlayer),
          Spacer(),
          Image(
            image: AssetImage("assets/images/start_sentence.png"),
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (listPlayer.length < 10)
                      listPlayer.add(new Guest("guest"));
                  });
                },
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
  final List<Player> listPlayer;
  const ListUserInGame({Key? key, required this.listPlayer}) : super(key: key);

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
              child: ListView.builder(
                  itemCount: widget.listPlayer.length,
                  itemBuilder: (context, index) {
                    return UserInGame(player: widget.listPlayer[index]);
                  }),
            ),
            RichText(
              text: TextSpan(
                text: widget.listPlayer.length.toString(),
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: CupertinoColors.black,
                    decoration: TextDecoration.none),
                children: const <TextSpan>[
                  TextSpan(
                      text: ' player(s)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ));
  }
}

class UserInGame extends StatefulWidget {
  final Player player;
  const UserInGame({Key? key, required this.player}) : super(key: key);

  @override
  State<UserInGame> createState() => _UserInGameState();
}

class _UserInGameState extends State<UserInGame> {
  final userNameTextField = TextEditingController();
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
                  image: AssetImage(widget.player.image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          widget.player is Guest
              ? Material(
                  surfaceTintColor: Colors.transparent,
                  child: SizedBox(
                    width: 230,
                    child: TextField(
                      controller: userNameTextField,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Pseudonyme',
                      ),
                      cursorColor: Colors.purple,
                      textAlign: TextAlign.left,
                    ),
                  ),
                )
              : Text(
                  widget.player.name,
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
  final AbstractRound currentRound;
  final Function(int) setSelectedValue;
  const InGameCardThrow(
      {Key? key,
      required this.numberThrow,
      required this.currentRound,
      required this.setSelectedValue})
      : super(key: key);

  @override
  State<InGameCardThrow> createState() => _InGameCardThrowState();
}

class _InGameCardThrowState extends State<InGameCardThrow> {
  GlobalKey<_NumberPadState> _numberPadKey = GlobalKey();

  void initState() {
    super.initState();
  }

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
                        text: widget.currentRound.number.toString() +
                            " - " +
                            widget.numberThrow.toString() +
                            (widget.numberThrow == 1
                                ? "st"
                                : widget.numberThrow == 2
                                    ? "nd"
                                    : "rd"), //'1 - 1st',
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
                      pseudo: widget.currentRound.player.name,
                      image: widget.currentRound.player.image),
                ],
              )),
          NumberPad(
            numberThrow: widget.numberThrow,
            setSelectedValue: widget.setSelectedValue,
            currentRound: widget.currentRound,
            maxValue: widget.currentRound.getMaxPinsThisShot(),
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
  final int valueToReturn;
  const SpareButton(
      {Key? key,
      required this.onSonChanged,
      required this.currentSelected,
      required this.valueToReturn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSonChanged(valueToReturn);
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
              color: currentSelected == valueToReturn
                  ? Colors.pink
                  : CupertinoColors.black,
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
  final AbstractRound currentRound;
  final Function(int) setSelectedValue;
  final int maxValue;
  const NumberPad(
      {Key? key,
      required this.numberThrow,
      required this.setSelectedValue,
      required this.currentRound,
      required this.maxValue})
      : super(key: key);

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  int NumSelected = 0;

  void updateId(int newNum) {
    setState(() {
      NumSelected = newNum;
      widget.setSelectedValue(newNum);
    });
  }

  void initState() {
    NumSelected = 0;
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
                    isSelectable: widget.maxValue > 1 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 2,
                    isSelectable: widget.maxValue > 2 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 3,
                    isSelectable: widget.maxValue > 3 ? 1 : 0,
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
                    isSelectable: widget.maxValue > 4 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 5,
                    isSelectable: widget.maxValue > 5 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 6,
                    isSelectable: widget.maxValue > 6 ? 1 : 0,
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
                    isSelectable: widget.maxValue > 7 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 8,
                    isSelectable: widget.maxValue > 8 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                  Number(
                    currentSelected: NumSelected,
                    num: 9,
                    isSelectable: widget.maxValue > 9 ? 1 : 0,
                    onSonChanged: (int newId) {
                      updateId(newId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        widget.currentRound.shotIsStrike()
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
                valueToReturn: widget.maxValue,
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
