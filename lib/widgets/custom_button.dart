import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final audioPlayer = AudioPlayer();

  CustomButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  Future<void> playSound() async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource("sounds/button.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 80.0,
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        clipBehavior: Clip.antiAlias, // クリップエフェクトを追加
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.blueGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            onTap: () async {
              await playSound();
              onPressed();
            },
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'DelaGothicOne',
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
