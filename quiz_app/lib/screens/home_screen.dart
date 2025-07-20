import 'package:flutter/material.dart';
import '../data/question_data.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Categories')),
      body: Column(
        children: [
          const Divider(color: Colors.amber),
          Expanded(
            child: ListView(
              children: quizData.keys.map((category) {
                return Card(
                  color: const Color.fromARGB(255, 122, 133, 142),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      category,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 20,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(category: category),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
