import 'package:reversi/models/stone.dart';

class Board {
  final int size;
  List<List<Stone>> grid;

  Board({this.size = 8})
      : grid = List.generate(size, (index) => List.filled(size, Stone.none));

  Stone? getStone(int x, int y) {
    if (x < 0 || x >= size || y < 0 || y >= size) {
      return null;
    }
    return grid[y][x];
  }

  Board putStone(int x, int y, Stone stone) {
    if (x < 0 || x >= size || y < 0 || y >= size) {
      throw ArgumentError('Invalid coordinates');
    }
    if (grid[y][x] != Stone.none) {
      throw ArgumentError('The cell is already occupied');
    }
    grid[y][x] = stone;
    return this;
  }
}
