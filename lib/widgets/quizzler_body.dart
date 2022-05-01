import 'package:flutter/material.dart';
import 'package:quizzler_flutter/widgets/quizzler_button.dart';
import 'package:quizzler_flutter/widgets/quizzler_text.dart';

import '../model/question.dart';

class QuizzlerBody extends StatefulWidget {
  const QuizzlerBody({
    Key? key,
    required this.questions,
    required this.index,
    required this.nextQuestion,
  }) : super(key: key);

  final List<Question> questions;
  final int index;
  final Function nextQuestion;

  @override
  _QuizzlerBodyState createState() => _QuizzlerBodyState();
}

class _QuizzlerBodyState extends State<QuizzlerBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizzlerText(question: widget.questions[widget.index]),
        QuizzlerButton(
          nextQuestion: widget.nextQuestion,
          answer: true,
          color: Colors.green,
        ),
        QuizzlerButton(
          nextQuestion: widget.nextQuestion,
          answer: false,
          color: Colors.red,
        ),
      ],
    );
  }
}
