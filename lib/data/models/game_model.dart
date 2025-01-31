class GameModel {
  List<String> board;
  bool isXTurn;

  GameModel({required this.board, required this.isXTurn});

  factory GameModel.initial() {
    return GameModel(
      board: List.filled(9, ""),
      isXTurn: true,
    );
  }

  GameModel copyWith({required List<String> board, required bool isXTurn}) {
    return GameModel(
      board: board,
      isXTurn: isXTurn,
    );
  }
}
