import 'package:bowl_in/model/AbstractRound.dart';
import 'package:bowl_in/model/Round.dart';
import 'package:bowl_in/views/ingame_screen2.dart';
import 'package:bowl_in/widgets/button_new_party.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../views/game_screen.dart';
import '../views/ingame_screen.dart';
import '../views/main_screen.dart';
import '../views/rank_screen.dart';
import '../views/welcome_screen.dart';
import '../widgets/ingame_widgets.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'games',
          builder: (BuildContext context, GoRouterState state) {
            return const GameScreen();
          },
        ),
        GoRoute(
          path: 'ranking',
          builder: (BuildContext context, GoRouterState state) {
            return const RankScreen();
          },
        ),
        GoRoute(
          path: 'splash',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomeScreen();
          },
        ),
        GoRoute(
          path: 'in-game',
          builder: (BuildContext context, GoRouterState state) {
            if(state.extra is AbstractRound) {
              return InGameScreen2(currentRound: state.extra as AbstractRound);
            }
            return InGameScreen();
          },
        ),
        GoRoute(
          path: 'scoreboard',
          builder: (BuildContext context, GoRouterState state) {
            return FinalScoreBoard();
          },
        ),
      ],
    ),
  ],
);
