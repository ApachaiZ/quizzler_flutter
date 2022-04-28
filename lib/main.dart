import 'package:flutter/material.dart';
import 'package:quizzler_flutter/data/question_bank.dart';
import 'package:quizzler_flutter/widgets/quizzler_button.dart';
import 'package:quizzler_flutter/widgets/quizzler_text.dart';

import 'model/question.dart';

main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quizzler",
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text("Quizzler"),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int score = 0;
  int index = 0;
  List<Question> questions = QuestionBank().questionList;

  Icon myIcon({required IconData myIcon, required Color color}) {
    return (Icon(
      myIcon,
      color: color,
    ));
  }

  void nextQuestion(bool? answer) {
    if (answer == questions[index].answer) {
      score++;
      scoreKeeper.add(myIcon(
        myIcon: Icons.check,
        color: Colors.green,
      ));
    } else if (answer == !questions[index].answer) {
      scoreKeeper.add(myIcon(
        myIcon: Icons.close,
        color: Colors.red,
      ));
    }
    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      setState(() {
        scoreKeeper.clear();
        score = 0;
        index = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (index < questions.length - 1) ...[
          QuizzlerText(question: questions[index]),
          QuizzlerButton(
            nextQuestion: nextQuestion,
            answer: true,
            color: Colors.green,
          ),
          QuizzlerButton(
            nextQuestion: nextQuestion,
            answer: false,
            color: Colors.red,
          ),
        ] else ...[
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
              onPressed: () => nextQuestion(null),
              child: const Text(
                "Cliquer pour rejouer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ),
      ],
    );
  }
}