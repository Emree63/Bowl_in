import 'package:bowl_in/presentation/font.dart';
import 'package:bowl_in/views/profile_screen.dart';
import 'package:bowl_in/views/rank_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'analysis_screen.dart';
import 'game_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: [
          GameScreen(),
          RankScreen(),
          AnalysisScreen(),
          ProfileScreen()
        ][currentPageIndex],
        bottomNavigationBar: SizedBox(
            height: 75,
            child: NavigationBarTheme(
              data: const NavigationBarThemeData(
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
                    selectedIndex: currentPageIndex,
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                    height: MediaQuery.of(context).size.height * 0.1,
                    onDestinationSelected: (index) =>
                        setState(() => currentPageIndex = index),
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
                          Icons.show_chart,
                          color: Colors.grey,
                          size: 25,
                        ),
                        label: '',
                        selectedIcon: Icon(
                          Icons.show_chart,
                          size: 25,
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
