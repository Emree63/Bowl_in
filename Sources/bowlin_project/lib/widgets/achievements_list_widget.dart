import 'package:bowl_in/main.dart';
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
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                    imagePath: 'assets/images/achievements/5friends_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/5friends_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/achievements/win_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/win_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath:
                        'assets/images/achievements/10strikes_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/10strikes_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath:
                        'assets/images/achievements/150points_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/150points_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath:
                        'assets/images/achievements/2strikeinarow_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/2strikeinarow_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/achievements/5games_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/5games_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/achievements/10spares_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/10spares_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath:
                        'assets/images/achievements/10x9spins_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/10x9spins_unlocked.png',
                    isUnlocked: 0,
                  ),
                  AchievementWidget(
                    imagePath: 'assets/images/achievements/0point_locked.png',
                    imagePathUnlocked:
                        'assets/images/achievements/0point_unlocked.png',
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
            image: DecorationImage(
                image: AssetImage(MyApp.controller.userCurrent.image),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyApp.controller.userCurrent.name,
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
                        text: MyApp.controller.userCurrent.stat.highscore
                                .toString() +
                            " pts",
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
              MyApp.controller.userCurrent.games.length > 0
                  ? RichText(
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
                            text: DateTime.now()
                                .difference(MyApp
                                    .controller.userCurrent.games.first.date)
                                .inDays
                                .toString(),
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
                    )
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
