import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button_new_party.dart';
import '../widgets/scores_list_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
        Container(
          height: 120,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/image_score.png"),
          )),
          child: Center(
              child: Text(
            "Scores",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          )),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonNewParty(),
                const SizedBox(width: 20),
                ButtonJoinParty(),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              width: MediaQuery.of(context).size.width,
              child: ListCardGame(),
            ),
          ],
        )
      ],
    );
  }
}
