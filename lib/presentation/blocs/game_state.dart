part of 'game_bloc.dart';

class GameState {
  final GameModel gameModel;
  final String? winner; // Add winner state
  final bool isGameOver; // Add game over state

  GameState({required this.gameModel, this.winner, this.isGameOver = false});

  GameState copyWith({GameModel? gameModel, String? winner, bool? isGameOver}) {
    return GameState(
      gameModel: gameModel ?? this.gameModel,
      winner: winner ?? this.winner,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}
