import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reversi/screens/title_screen.dart';

void main() => runApp(const ProviderScope(child: RiversiApp()));

class RiversiApp extends StatelessWidget {
  const RiversiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Riversi',
      home: TitleScreen(),
    );
  }
}
