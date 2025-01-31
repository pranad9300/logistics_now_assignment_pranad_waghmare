import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme.dart';
import '../../blocs/game_bloc.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  void onPlayerTap(BuildContext context, int index) =>
      context.read<GameBloc>().add(TileTappedEvent(index: index));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onPlayerTap(context, index),
              child: AnimatedContainer(
                duration: tileAnimationDuration,
                margin: boxShadowBlurRadius,
                decoration: BoxDecoration(
                  color: tileColor,
                  borderRadius: tileBorderRadius,
                  boxShadow: [
                    BoxShadow(
                      color: xColor,
                      blurRadius: state.gameModel.board[index] == "X"
                          ? boxShadowRadius
                          : 0,
                    ),
                    BoxShadow(
                      color: oColor,
                      blurRadius: state.gameModel.board[index] == "O"
                          ? boxShadowRadius
                          : 0,
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: symbolAnimationDuration,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                          opacity: animation,
                          child:
                              ScaleTransition(scale: animation, child: child));
                    },
                    child: Text(
                      state.gameModel.board[index],
                      key: ValueKey(state.gameModel.board[index]),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: state.gameModel.board[index] == "X"
                            ? xColor
                            : oColor,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 9,
        );
      },
    );
  }
}
