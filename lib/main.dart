import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_number/game_failure.dart';
import 'package:guess_number/game_victory.dart';
import 'package:guess_number/menu_page.dart';

import 'game.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MenuPage();
      },
    ),
    GoRoute(
      path: '/game',
      builder: (context, state) => const Game(title: 'Devine le nombre'),
    ),
    GoRoute(
      path: '/success',
      builder: (context, state) => const GameVictory(title: 'Victoire !'),
    ),
    GoRoute(
      path: '/failure',
      builder: (context, state) => const GameFailure(title: 'Échec !'),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
