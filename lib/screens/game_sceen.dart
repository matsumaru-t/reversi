import 'package:flutter/material.dart';
import 'package:reversi/widgets/board_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/title_background.jpg'),
          fit: BoxFit.cover,
        )),
        child: const Center(
          child: BoardWidget(),
        ),
      ),
    );
  }
}
