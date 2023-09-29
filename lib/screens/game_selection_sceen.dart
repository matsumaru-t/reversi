import 'package:flutter/material.dart';
import 'package:reversi/widgets/custom_button.dart';
import 'package:reversi/utils/blackout_route.dart';
import 'package:reversi/screens/game_sceen.dart';

class GameSelectionScreen extends StatelessWidget {
  const GameSelectionScreen({super.key});

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
            children: [
              CustomButton(
                  label: "Single Play",
                  onPressed: () => {
                        Navigator.push(
                          context,
                          blackoutRoute(const GameScreen()),
                        )
                      }),
              const SizedBox(height: 30),
              CustomButton(label: "Online Play", onPressed: () => {}),
              const SizedBox(height: 60),
              CustomButton(
                  label: "Back",
                  onPressed: () => {
                        Navigator.pop(context),
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
