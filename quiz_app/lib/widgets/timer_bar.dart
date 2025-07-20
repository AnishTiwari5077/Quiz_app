import 'package:flutter/material.dart';

class TimerBar extends StatelessWidget {
  final double progress;

  const TimerBar({required this.progress, super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.grey.shade300,
      color: Colors.blue,
      minHeight: 10,
    );
  }
}
