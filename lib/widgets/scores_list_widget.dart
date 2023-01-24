import 'package:flutter/cupertino.dart';

class CardGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/card_game.png"),
            ),
          )),
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
        child: Expanded(
            child: ListView(
          shrinkWrap: true,
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
        )));
  }
}
