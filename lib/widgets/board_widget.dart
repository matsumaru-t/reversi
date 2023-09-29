import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reversi/providers/game_provider.dart';
import 'package:reversi/widgets/stone_widget.dart';
import 'package:reversi/models/stone.dart';

class BoardWidget extends ConsumerWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final size = gameState.board.size;

    final gridview = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size,
      ),
      itemBuilder: (context, index) {
        final x = index % size;
        final y = index ~/ size;
        final stone = gameState.board.getStone(x, y)!;

        return GestureDetector(
          onTap: () {
            final notifier = ref.read(gameProvider.notifier);
            notifier.putStone(x, y, gameState.turn);
          },
          child: Container(
            margin: const EdgeInsets.all(0.1),
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green[700]!),
              color: Colors.green[400],
            ),
            child: stone == Stone.none ? null : StoneWidget(stone),
          ),
        );
      },
      itemCount: size * size,
      padding: EdgeInsets.zero,
    );

    final screenSize = MediaQuery.of(context).size;
    final s = min(screenSize.width, screenSize.height) * 0.9;

    return Container(
      width: s,
      height: s,
      color: const Color.fromARGB(255, 51, 51, 51),
      padding: const EdgeInsets.all(1.0),
      child: gridview,
    );
  }
}
