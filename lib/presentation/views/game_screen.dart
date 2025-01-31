import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/game_bloc.dart';
import 'widgets/game_board.dart';
import 'widgets/reset_button.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _GameScreenContent();
  }
}

class _GameScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tic Tac Toe")),
      body: Center(
        child: Stack(
          children: [
            GameBoard(),
            BlocListener<GameBloc, GameState>(
              listener: (context, state) {
                if (state.isGameOver) {
                  String message;
                  if (state.winner != null) {
                    message = "Player ${state.winner} wins!";
                  } else {
                    message = "It's a draw!";
                  }

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Game Over"),
                        content: Text(message),
                        actions: <Widget>[
                          TextButton(
                            child: Text("Restart"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              context.read<GameBloc>().add(ResetGameEvent());
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
      floatingActionButton: ResetButton(),
    );
  }
}
