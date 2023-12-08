import 'dart:async';
import 'package:flutter/material.dart';

class CountdownButton extends StatefulWidget {
  const CountdownButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<CountdownButton> createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton> {
  int revertTime = 60;
  late Timer revertTimer;

  _CountdownButtonState() {
    revertTime = 60;
    revertTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        revertTime--;
      });
      if (revertTime == 0) {
        revertTimer.cancel();
        widget.onPressed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text('Revert to original configuration ($revertTime)'),
        onPressed: () {
          revertTimer.cancel();
          widget.onPressed();
        });
  }
}
