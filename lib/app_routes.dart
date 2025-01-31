import 'package:flutter/material.dart';

import 'presentation/views/game_screen.dart';
import 'presentation/views/start_screen.dart';

class AppRoutes {
  static const String startScreen = '/start';
  static const String gameScreen = '/game';

  static Map<String, WidgetBuilder> routes = {
    startScreen: (context) => StartScreen(),
    gameScreen: (context) => GameScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case startScreen:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case gameScreen:
        return MaterialPageRoute(builder: (_) => GameScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
