import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/game_model.dart';
import '../../domain/repository/game_repository.dart';
part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository _gameRepository;

  GameBloc({
    required GameRepository gameRepository,
  })  : _gameRepository = gameRepository, // Initialize the field

        super(GameState(gameModel: GameModel.initial())) {
    on<TileTappedEvent>((event, emit) {
      if (state.isGameOver || state.gameModel.board[event.index].isNotEmpty) return;

      final updatedGameModel =
          _gameRepository.makeMove(state.gameModel, event.index);
      final winner = _gameRepository.checkWinner(updatedGameModel.board);
      final isGameOver =
          winner != null || _gameRepository.isBoardFull(updatedGameModel.board);

      emit(state.copyWith(
        gameModel: updatedGameModel,
        winner: winner,
        isGameOver: isGameOver,
      ));
      
    });

    on<ResetGameEvent>((event, emit) {
      emit(GameState(gameModel: GameModel.initial()));
    });
  }
}
