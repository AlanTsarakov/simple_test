import 'package:simple_test/models/question.dart';

final List<Question> sampleQuestions = [
  Question(
    text: 'Что такое Flutter?',
    options: ['Язык программирования', 'Фреймворк для UI', 'База данных', 'Операционная система'],
    correctAnswerIndex: 1,
  ),
  Question(text: "Сколько пальцев у человека", options: ["1", "2", "3", "20"], correctAnswerIndex: 3)
];