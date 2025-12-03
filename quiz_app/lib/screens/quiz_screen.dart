import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/constant/app_theme.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/option_card.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({required this.category, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late List<Question> questions;
  late List<Question> originalQuestions;
  int currentIndex = 0;
  int? selectedIndex;
  bool answered = false;
  int score = 0;
  Timer? timer;
  int timeLeft = 15;
  List<int?> userAnswers = [];
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _initializeQuiz() {
    // Get original questions and shuffle their options
    originalQuestions = quizData[widget.category]!;
    questions = originalQuestions.map((q) => q.shuffleOptions()).toList();
    startTimer();
  }

  void startTimer() {
    timeLeft = 15;
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }

      if (timeLeft == 0) {
        t.cancel();
        if (!answered) {
          handleAnswer(null); // Timeout - no answer selected
        }
      } else {
        setState(() {
          timeLeft--;
        });
      }
    });
  }

  void handleAnswer(int? index) {
    if (answered) return;

    setState(() {
      answered = true;
      selectedIndex = index;
      userAnswers.add(index);

      if (index != null && index == questions[currentIndex].correctIndex) {
        score++;
      }
    });

    timer?.cancel();

    // Wait before moving to next question
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        nextQuestion();
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
        answered = false;
      });
      _progressController.forward(from: 0.0);
      startTimer();
    } else {
      // Quiz completed
      timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            questions: questions,
            originalQuestions: originalQuestions,
            userAnswers: userAnswers,
            score: score,
            category: widget.category,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  Color _getTimerColor() {
    if (timeLeft > 10) return AppTheme.successColor;
    if (timeLeft > 5) return AppTheme.warningColor;
    return AppTheme.errorColor;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final q = questions[currentIndex];
    final progress = (currentIndex + 1) / questions.length;

    return WillPopScope(
      onWillPop: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit Quiz?'),
            content: const Text(
              'Your progress will be lost. Are you sure you want to exit?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.errorColor,
                ),
                child: const Text('Exit'),
              ),
            ],
          ),
        );
        return result ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${currentIndex + 1}/${questions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: theme.colorScheme.surfaceVariant,
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.primary,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Timer Card
                    Card(
                      color: _getTimerColor().withOpacity(0.1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: _getTimerColor(), width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: _getTimerColor(),
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              '$timeLeft seconds',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _getTimerColor(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Question Card
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(
                                  0.1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Question ${currentIndex + 1}',
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              q.question,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Options
                    ...List.generate(q.options.length, (i) {
                      return OptionCard(
                        option: q.options[i],
                        isSelected: selectedIndex == i,
                        isCorrect: i == q.correctIndex,
                        showAnswer: answered,
                        onTap: () => handleAnswer(i),
                      );
                    }),

                    // Explanation (shown after answering)
                    if (answered && q.explanation != null) ...[
                      const SizedBox(height: 16),
                      Card(
                        color: AppTheme.successColor.withOpacity(0.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: AppTheme.successColor.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lightbulb_outline,
                                color: AppTheme.successColor,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Explanation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.successColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      q.explanation!,
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
