import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementWidget extends StatelessWidget {
  final String imagePath;
  final String imagePathUnlocked;
  final int isUnlocked;
  const AchievementWidget(
      {Key? key,
      required this.imagePath,
      required this.imagePathUnlocked,
      required this.isUnlocked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: this.isUnlocked == 0
              ? AssetImage(this.imagePath)
              : AssetImage(this.imagePathUnlocked),
        ),
      ),
    );
  }
}

class ListAchievementWidget extends StatelessWidget {
  final int nbUnlocked;
  const ListAchievementWidget({Key? key, required this.nbUnlocked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: 520,
            height: 520,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image_achievement_table.png"),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 65, 0, 0),
              child: Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 15,
                spacing: -5,
                children: [
                  Container(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(200, 0, 0, 30),
                        child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(5 / 360),
                            child: Text(
                              this.nbUnlocked.toString() + "/9 unlocked",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                  color: Color(0xff2461B2)),
                            )),
                      ),
                    ),
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 1,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 1,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 1,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 1,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/image_achievement_card.png',
                    imagePathUnlocked:
                        'assets/images/image_achievement_unlocked.png',
                    isUnlocked: 0,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lucas",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Highscore :",
                        style: GoogleFonts.roboto(
                            color: Colors.white.withOpacity(0.65),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      TextSpan(
                        text: "122 pts",
                        style: GoogleFonts.roboto(
                            color: Color(0xffF40375).withOpacity(0.75),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Last game ",
                      style: GoogleFonts.roboto(
                          color: Colors.white.withOpacity(0.65),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    TextSpan(
                      text: "23",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    TextSpan(
                      text: " days(s) ago",
                      style: GoogleFonts.roboto(
                          color: Colors.white.withOpacity(0.65),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
