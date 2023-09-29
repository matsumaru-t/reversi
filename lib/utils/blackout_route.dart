import 'package:flutter/material.dart';

PageRouteBuilder blackoutRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final color = ColorTween(
              begin: Colors.transparent,
              end: const Color.fromARGB(255, 51, 51, 51))
          .animate(CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));

      final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animation,
              curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));

      return Stack(
        children: [
          AnimatedBuilder(
            animation: color,
            builder: (context, _) {
              return Container(color: color.value);
            },
          ),
          FadeTransition(opacity: opacity, child: child),
        ],
      );
    },
  );
}
