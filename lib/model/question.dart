import 'package:flutter/material.dart';

class Question {
  Question({
    Key? key,
    required this.question,
    required this.answer,
  });

  final String question;
  final bool answer;
}
