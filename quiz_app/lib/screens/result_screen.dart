import 'package:flutter/material.dart';
import 'package:quiz_app/question_model.dart';
import 'package:quiz_app/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<int> userAnswers;
  final int score;

  const ResultScreen({
    required this.questions,
    required this.userAnswers,
    required this.score,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    'You scored $score out of ${questions.length}',
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: questions.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, i) {
                  final question = questions[i];
                  final isCorrect = userAnswers[i] == question.correctIndex;
                  final userAnswerIndex = userAnswers[i];

                  return Card(
                    elevation: 2,
                    color: isCorrect
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        question.question,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Answer: ${userAnswerIndex == -1 ? 'Not Answered' : question.options[userAnswerIndex]}',
                              style: TextStyle(
                                color: isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Correct Answer: ${question.options[question.correctIndex]}',
                            ),
                            const SizedBox(height: 5),
                            Text(isCorrect ? '✅ Correct' : '❌ Incorrect'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.replay),
              label: const Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 255, 77),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
