import 'package:flutter/material.dart';

class OtpTimer extends StatelessWidget {
  final int timerSeconds;

  const OtpTimer({Key? key, required this.timerSeconds}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int minutes = timerSeconds ~/ 60;
    int seconds = timerSeconds % 60;

    String timerText = '$minutes:${seconds.toString().padLeft(2, '0')}';

    return Text(
      timerText,
      style: const TextStyle(fontSize: 18),
    );
  }
}
