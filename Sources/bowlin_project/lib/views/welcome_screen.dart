import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
        Positioned(
            bottom: 0,
            child: Image(
                width: MediaQuery.of(context).size.width,
                image: AssetImage("assets/images/background_welcomepage.png"))),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Image(
                  width: MediaQuery.of(context).size.width - 70,
                  image: AssetImage("assets/images/icon_bowl_in.png")),
              Spacer(),
              ButtonConnexion(),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ButtonConnexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(
        Icons.arrow_forward_rounded,
        color: Colors.white,
        size: 50.0,
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 7,
          color: Color(0xffFF419B),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Color(0xffF40375),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        minimumSize: Size(90, 90),
      ),
    );
  }
}
