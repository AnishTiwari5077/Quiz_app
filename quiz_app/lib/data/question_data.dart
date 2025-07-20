import 'package:quiz_app/question_model.dart';

final Map<String, List<Question>> quizData = {
  'General Knowledge': [
    Question(
      question: 'What is the capital of France?',
      options: ['Berlin', 'London', 'Paris', 'Madrid'],
      correctIndex: 2,
    ),
    Question(
      question: 'How many continents are there?',
      options: ['5', '6', '7', '8'],
      correctIndex: 2,
    ),
  ],
  'Technology': [
    Question(
      question: 'Who developed Flutter?',
      options: ['Apple', 'Google', 'Facebook', 'Microsoft'],
      correctIndex: 1,
    ),
    Question(
      question: 'What does CPU stand for?',
      options: [
        'Central Performance Unit',
        'Central Processing Unit',
        'Control Panel Unit',
        'Computer Power Unit',
      ],
      correctIndex: 1,
    ),
  ],
};
