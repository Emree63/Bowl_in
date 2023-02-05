import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

class CardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(41, 0, 41, 10),
        child: GestureDetector(
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
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130, 3, 0, 0),
                    child: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: Opacity(
                            opacity: 0.1,
                            child: Stack(
                              children: [
                                GradientText(
                                  "125",
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
                                  "125",
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
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Toast(),
                      Toast(),
                    ],
                  ),
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(25, 15, 0, 0),
                              child: SizedBox(
                                width: 130,
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: [
                                    ProfilPicture(),
                                    ProfilPicture(),
                                    ProfilPicture(),
                                    ProfilPicture(),
                                    ProfilPicture(),
                                    ProfilPicture(),
                                  ],
                                ),
                              )),
                          Spacer(),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 15, 0),
                              child: GradientText(
                                "125",
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
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          onTap: () => context.go('/in-game'),
        ));
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
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
            CardGame(),
          ],
        ));
  }
}

class ProfilPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/image_user_green.png"),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

class Toast extends StatelessWidget {
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
                "12 janv.",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            )));
  }
}
