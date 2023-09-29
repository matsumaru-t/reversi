import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reversi/models/board.dart';
import 'package:reversi/models/stone.dart';

class GameState {
  final Board board;
  final Stone turn;

  GameState({required this.board, required this.turn});

  GameState copyWith({Board? board, Stone? turn}) {
    return GameState(
      board: board ?? this.board,
      turn: turn ?? this.turn,
    );
  }
}

final gameProvider =
    NotifierProvider<GameNotifier, GameState>(() => GameNotifier());

class GameNotifier extends Notifier<GameState> {
  @override
  GameState build() {
    return GameState(
      board: Board(),
      turn: Stone.black,
    );
  }

  void putStone(int x, int y, Stone stone) {
    final board = state.board;
    final turn = state.turn;

    if (board.getStone(x, y) != Stone.none) {
      return;
    }

    board.putStone(x, y, stone);
    final newTurn = turn == Stone.black ? Stone.white : Stone.black;

    state = state.copyWith(board: board, turn: newTurn);
  }
}
