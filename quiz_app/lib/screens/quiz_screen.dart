import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/question_model.dart';

import 'result_screen.dart';
import '../widgets/option_card.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({required this.category, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentIndex = 0;
  int selectedIndex = -1;
  bool answered = false;
  int score = 0;
  Timer? timer;
  int timeLeft = 15;
  List<int> userAnswers = [];

  @override
  void initState() {
    super.initState();
    questions = quizData[widget.category]!;
    startTimer();
  }

  void startTimer() {
    timeLeft = 10;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        t.cancel();
        handleAnswer(-1); // Timeout
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  void handleAnswer(int index) {
    if (answered) return;
    setState(() {
      answered = true;
      selectedIndex = index;
      userAnswers.add(index);
      if (index == questions[currentIndex].correctIndex) score++;
    });

    timer?.cancel();
    Future.delayed(const Duration(seconds: 1), nextQuestion);
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = -1;
        answered = false;
      });
      startTimer();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            questions: questions,
            userAnswers: userAnswers,
            score: score,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Time Left: $timeLeft s',
              style: const TextStyle(fontSize: 18, color: Colors.red),
            ),
            const SizedBox(height: 20),
            Text(
              'Q${currentIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              q.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...List.generate(q.options.length, (i) {
              return OptionCard(
                option: q.options[i],
                isSelected: selectedIndex == i,
                isCorrect: i == q.correctIndex,
                showAnswer: answered,
                onTap: () => handleAnswer(i),
              );
            }),
          ],
        ),
      ),
    );
  }
}
