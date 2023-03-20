import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpareCard extends StatelessWidget {
  final int score;
  const SpareCard({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image_spare_card.png"),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Text(
            this.score.toString(),
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Color(0xffF40375),
                fontSize: 28),
          ),
        )
      ],
    );
  }
}

class StrikeCard extends StatelessWidget {
  final int score;
  const StrikeCard({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image_strike_card.png"),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Text(
            this.score.toString(),
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Color(0xffF40375),
                fontSize: 28),
          ),
        )
      ],
    );
  }
}

class GameCard extends StatelessWidget {
  final int score;
  const GameCard({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image_game_card.png"),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Text(
            this.score.toString(),
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                color: Color(0xffF40375),
                fontSize: 28),
          ),
        )
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final double val;
  final int precision;

  const StatsCard({Key? key, required this.title, required this.val, required this.precision})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width - 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.title,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color(0xff241E40),
                    fontSize: 18),
              ),
              Spacer(),
              Text(
                this.val.toStringAsFixed(precision),
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                    color: Color(0xffF40375)),
              ),
            ],
          ),
        ));
  }
}
