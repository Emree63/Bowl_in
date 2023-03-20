import 'package:bowl_in/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/analysis_card.dart';
import '../widgets/scores_list_widget.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: CustomScroll(),
        child: SingleChildScrollView(
          child: Stack(alignment: Alignment.topCenter, children: [
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
            Image.asset("assets/images/background_analysis.png"),
            Positioned(
                top: 150,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 34,
                        child: SpareCard(
                            score: MyApp.controller.userCurrent.stat.nbSpares),
                      ),
                      Positioned(
                        top: 0,
                        child: StrikeCard(
                            score: MyApp.controller.userCurrent.stat.nbStrikes),
                      ),
                      Positioned(
                        right: 34,
                        child: GameCard(
                            score: MyApp.controller.userCurrent.stat.nbGames),
                      )
                    ],
                  ),
                )),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/image_analysis.png"),
                )),
                child: Center(
                    child: Text(
                  "Analysis",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1ABAE0),
                      fontSize: 20),
                )),
              ),
            ),
            Positioned(
                bottom: 100,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  verticalDirection: VerticalDirection.up,
                  children: [
                    StatsCard(
                        title: "Number of victory",
                        val: MyApp.controller.userCurrent.stat.nbVictory.toDouble(),
                        precision: 0,
                    ),
                    StatsCard(
                        title: "Average pins per round",
                        val: MyApp.controller.userCurrent.stat.avgPinsPerRound,
                        precision: 2,
                    ),
                  ],
                ))
          ]),
        ));
  }
}
