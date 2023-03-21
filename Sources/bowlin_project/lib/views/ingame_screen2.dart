import 'package:bowl_in/main.dart';
import 'package:bowl_in/model/AbstractRound.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/ingame_widgets.dart';

class InGameScreen2 extends StatefulWidget {
  final AbstractRound currentRound;
  const InGameScreen2({Key? key, required this.currentRound}) : super(key: key);

  @override
  State<InGameScreen2> createState() => _InGameScreen2State();
}

class _InGameScreen2State extends State<InGameScreen2> {
  late InGameCardThrow widgetHolder;
  int selectedValue = 0;
  void setSelectedValue(int val) {
    selectedValue = val;
  }

  void initState() {
    if (widget.currentRound.firstThrow == null) {
      widgetHolder = InGameCardThrow(
          numberThrow: 1,
          currentRound: widget.currentRound,
          setSelectedValue: setSelectedValue);
    } else if (widget.currentRound.secondThrow == null) {
      widgetHolder = InGameCardThrow(
          numberThrow: 2,
          currentRound: widget.currentRound,
          setSelectedValue: setSelectedValue);
    } else {
      widgetHolder = InGameCardThrow(
          numberThrow: 3,
          currentRound: widget.currentRound,
          setSelectedValue: setSelectedValue);
    }

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
            widgetHolder,
            Spacer(),
            ElevatedButton(
              onPressed: () {
                bool isFinished =
                    widget.currentRound.computeNext(selectedValue);

                if (widget.currentRound.isSpareOrStrike()) {
                  MyApp.controller.gamePlayer.onSpareOrStrike();
                }

                MyApp.controller.gamePlayer.onNext(isFinished, context);
              },
              child: Text(
                "PLAY",
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
