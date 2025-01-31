import '../../data/models/game_model.dart';

class GameRepository {
  GameModel makeMove(GameModel gameModel, int index) {
    List<String> updatedBoard = List.from(gameModel.board);
    updatedBoard[index] = gameModel.isXTurn ? "X" : "O";
    return gameModel.copyWith(board: updatedBoard, isXTurn: !gameModel.isXTurn);
  }

  String? checkWinner(List<String> board) {
    // Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != "" &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3 + 1] == board[i * 3 + 2]) {
        return board[i * 3];
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] != "" &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        return board[i];
      }
    }

    // Check diagonals
    if (board[0] != "" && board[0] == board[4] && board[4] == board[8]) {
      return board[0];
    }
    if (board[2] != "" && board[2] == board[4] && board[4] == board[6]) {
      return board[2];
    }

    return null;
  }

  bool isBoardFull(List<String> board) {
    return board.every((element) => element != "");
  }
}
