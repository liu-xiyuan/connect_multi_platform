import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtonBar extends StatelessWidget {
  const WindowButtonBar({super.key});

  final double size = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => appWindow.minimize(),
          child: Container(width: size, color: Colors.transparent),
        ),
        GestureDetector(
          onTap: () => appWindow.maximize(),
          child: Container(width: size, color: Colors.transparent),
        ),
        GestureDetector(
          onTap: () => appWindow.close(),
          child: Container(width: size, color: Colors.transparent),
        ),
      ],
    );
  }
}
