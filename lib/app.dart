import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_routes.dart';
import 'core/theme.dart';
import 'domain/repository/game_repository.dart';
import 'presentation/blocs/game_bloc.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<GameRepository>(
        // Repository must be provided above the bloc
        create: (context) => GameRepository(),
        child: BlocProvider<GameBloc>(
          create: (context) =>
              GameBloc(gameRepository: context.read<GameRepository>()),
          child: MaterialApp(
            title: 'Tic Tac Toe',
            theme: appTheme, // Your theme
            initialRoute: AppRoutes.startScreen, // Set initial route
            routes: AppRoutes.routes, // Use named routes
            onGenerateRoute:
                AppRoutes.generateRoute, // For handling unknown routes
          ),
        ));
  }
}
