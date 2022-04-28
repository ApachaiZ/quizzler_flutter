import '../model/question.dart';

class QuestionBank {
  final List<Question> questionList = [
    Question(question: "Cotentin aime le nodeJS", answer: true),
    Question(question: "Paul a beaucoup de cheveux", answer: false),
    Question(question: "Tanguy est grand", answer: true),
    Question(question: "Jules est non violent", answer: false),
    Question(question: "PF poignarde dans le dos", answer: true),
    Question(question: "Cotentin va faire du mobile", answer: false),
    Question(question: "Roselyne a un donjon", answer: true),
    Question(question: "Cotentin va recevoir ses cartes magic", answer: false),
  ];

  List<Question> get list {
    return questionList;
  }
}
