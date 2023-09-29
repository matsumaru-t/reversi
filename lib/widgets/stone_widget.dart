import 'package:flutter/material.dart';
import 'package:reversi/models/stone.dart';

class StoneWidget extends StatelessWidget {
  final Stone stone;

  const StoneWidget(this.stone, {super.key});

  @override
  Widget build(BuildContext context) {
    Color stoneColor;

    switch (stone) {
      case Stone.black:
        stoneColor = const Color.fromARGB(255, 51, 51, 51);
        break;
      case Stone.white:
        stoneColor = Colors.white;
        break;
      default:
        stoneColor = Colors.transparent;
        break;
    }

    return Container(
      decoration:
          BoxDecoration(color: stoneColor, shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(0, 2),
        ),
      ]),
    );
  }
}
