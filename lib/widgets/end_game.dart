import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  const EndGame({
    Key? key,
    required this.score,
    required this.nextQuestion,
  }) : super(key: key);

  final int score;
  final Function nextQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Votre score est de $score !",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
            ),
            onPressed: () => nextQuestion(stop: true),
            child: const Text(
              "Cliquer pour rejouer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
