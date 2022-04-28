import 'package:flutter/material.dart';

class QuizzlerButton extends StatelessWidget {
  const QuizzlerButton({
    Key? key,
    required this.nextQuestion,
    required this.answer,
    required this.color,
  }) : super(key: key);

  final bool answer;
  final Color color;
  final Function nextQuestion;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color,
          ),
          onPressed: () => nextQuestion(answer),
          child: Text(
            answer ? "Vrai" : "Faux",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
