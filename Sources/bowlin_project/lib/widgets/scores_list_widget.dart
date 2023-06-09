import 'package:bowl_in/main.dart';
import 'package:bowl_in/widgets/button_new_party.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../model/Game.dart';

class CardGame extends StatelessWidget {
  final Game game;

  const CardGame({Key? key, required this.game}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage("assets/images/card_game.png"),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Toast(
                              value: DateFormat('dd MMMM', 'fr_FR')
                                  .format(game.date)),
                          Toast(value: DateFormat('HH:mm').format(game.date)),
                        ],
                      )),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 35, 0, 0),
                        child: SizedBox(
                            width: 130,
                            child: Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: game.players
                                    .map((e) => ProfilPicture(
                                          path: e.image.toString(),
                                        ))
                                    .toList())),
                      )),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 25, 15, 0),
                        child: GradientText(
                          game.pointsCurrentUser.toString(),
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                          ),
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          radius: 2.5,
                          colors: [
                            Color(0xff181818),
                            Color(0xff626262),
                          ],
                        )),
                  ),
                  Positioned(
                    right: 0,
                    child: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: Opacity(
                            opacity: 0.1,
                            child: Stack(
                              children: [
                                GradientText(
                                  game.pointsCurrentUser.toString(),
                                  style: GoogleFonts.karla(
                                    fontSize: 105.0,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1
                                      ..color = Color(0xff6100FF),
                                  ),
                                  gradientType: GradientType.linear,
                                  gradientDirection: GradientDirection.rtl,
                                  radius: 2.5,
                                  colors: [
                                    Color(0xff5500E0),
                                    Color(0xff2C2C2C).withOpacity(0),
                                  ],
                                ),
                                GradientText(
                                  game.pointsCurrentUser.toString(),
                                  style: GoogleFonts.karla(
                                    fontSize: 105.0,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  gradientType: GradientType.linear,
                                  gradientDirection: GradientDirection.rtl,
                                  radius: 2.5,
                                  colors: [
                                    Color(0xff5500E0),
                                    Color(0xff2C2C2C).withOpacity(0),
                                  ],
                                ),
                              ],
                            ))),
                  )
                ],
              )),
        ],
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return ScoreBoardModal(
                  gamedetail: MyApp.controller.gameMgr.getGameById(game.id));
            });
      },
    );
  }
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ListCardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: CustomScroll(),
        child: ListView.builder(
          shrinkWrap: false,
          itemCount: MyApp.controller.userCurrent.games.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: CardGame(game: MyApp.controller.userCurrent.games[index]),
            );
          },
        ));
  }
}

class ProfilPicture extends StatelessWidget {
  final String path;

  const ProfilPicture({Key? key, required this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

class Toast extends StatelessWidget {
  final String value;

  const Toast({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 3, 10, 0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xff735CDD),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(11.0, 3, 11.0, 3),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            )));
  }
}
