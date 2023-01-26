import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNewParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("+  New game"),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 4,
          color: Color(0xffFF419B),
        ),
        onPrimary: Colors.white,
        primary: Color(0xffF40375),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        minimumSize: Size(130, 37),
      ),
    );
  }
}

class NewGameModal extends StatelessWidget {
  const NewGameModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Transform.scale(
              scale: 1.14,
              child: Image.asset("assets/images/image_newgame_modal.png")),
          SizedBox(
            height: 245,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text("Join game",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w900, fontSize: 18)),
                ),
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/images/sentence_joingame.png",
                  width: 240,
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          width: 290,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.grey,
                              ),
                              const BoxShadow(
                                color: Colors.black,
                                spreadRadius: -20.0,
                                blurRadius: 12.0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: TextField(
                            maxLength: 6,
                            decoration: new InputDecoration(
                              hintText: 'Party code...',
                              counterStyle: TextStyle(
                                height: double.minPositive,
                              ),
                              counterText: "",
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff989898)),
                          ),
                        )
                      ],
                    )),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      child: Container(
                        height: 50,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Color(0xffB70056),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "CONFIRM",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Color(0xffF40375),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(290, 45),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonJoinParty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return NewGameModal();
            });
      },
      child: Text("Join game"),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 4,
          color: Color(0xff6B6588),
        ),
        onPrimary: Colors.white,
        primary: Color(0xff45405D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        minimumSize: Size(130, 37),
      ),
    );
  }
}
