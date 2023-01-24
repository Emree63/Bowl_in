import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
            child: Image(
                width: MediaQuery.of(context).size.width,
            image: AssetImage("assets/images/background_welcomepage.png"))),
      ],
    );
  }
}
