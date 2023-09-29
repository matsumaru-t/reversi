import 'package:flutter/material.dart';
import 'package:reversi/widgets/custom_button.dart';
import 'package:reversi/screens/game_selection_sceen.dart';
import 'package:reversi/utils/blackout_route.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/title_background.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              const SizedBox(height: 60),
              CustomButton(
                  label: "Start Game",
                  onPressed: () {
                    Navigator.push(
                      context,
                      blackoutRoute(const GameSelectionScreen()),
                    );
                  }),
              const SizedBox(height: 30),
              CustomButton(label: "Settings", onPressed: () => {}),
            ],
          ),
        ),
      ),
    );
  }
}
