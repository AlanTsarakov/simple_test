import 'package:simple_test/models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    text: 'Сколько будет 2+3*2?',
    options: ['6', '7', '10', '8'],
    correctAnswerIndex: 3,
  ),
  Question(text: "Сколько пальцев у человека?", options: ["12", "10", "36", "20"], correctAnswerIndex: 3),
  Question(text: "Медсестра делает уколы пациенту каждые 30 минут. Сколько уколов она сделает за 2 часа", options: ["4", "5", "1", "6"], correctAnswerIndex: 1)
];