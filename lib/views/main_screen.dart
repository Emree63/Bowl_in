import 'package:bowl_in/presentation/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/scores_list_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  int get index => _index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/image_score.png"),
                )),
                child: Center(
                    child: Text(
                  "Scores",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height - 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListCardGame(),
                  )),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
            height: 75,
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Colors.transparent,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 200,
                  maxHeight: 200,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 500,
                      ),
                    ],
                  ),
                  child: NavigationBar(
                    animationDuration: const Duration(microseconds: 800),
                    selectedIndex: index,
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                    height: MediaQuery.of(context).size.height * 0.1,
                    onDestinationSelected: (index) =>
                        setState(() => _index = index),
                    backgroundColor: Colors.white,
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(
                          BowlInFont.home_icon,
                          color: Colors.grey,
                          size: 21,
                        ),
                        label: 'Profil',
                        selectedIcon: Icon(
                          BowlInFont.home_icon,
                          size: 21,
                        ),
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.show_chart,
                          color: Colors.grey,
                          size: 21,
                        ),
                        label: '',
                        selectedIcon: Icon(
                          Icons.show_chart,
                          size: 21,
                        ),
                      ),
                      NavigationDestination(
                        icon: Icon(
                          BowlInFont.rank_icon,
                          color: Colors.grey,
                          size: 21,
                        ),
                        label: '',
                        selectedIcon: Icon(
                          BowlInFont.rank_icon,
                          size: 21,
                        ),
                      ),
                      NavigationDestination(
                        icon: Icon(
                          BowlInFont.profil_icon,
                          color: Colors.grey,
                          size: 21,
                        ),
                        label: '',
                        selectedIcon: Icon(
                          BowlInFont.profil_icon,
                          size: 21,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
