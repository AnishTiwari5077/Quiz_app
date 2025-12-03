import 'package:flutter/material.dart';
import 'package:quiz_app/constant/app_theme.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<Question> originalQuestions;
  final List<int?> userAnswers;
  final int score;
  final String category;

  const ResultScreen({
    required this.questions,
    required this.originalQuestions,
    required this.userAnswers,
    required this.score,
    required this.category,
    super.key,
  });

  double get percentage => (score / questions.length) * 100;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final correctAnswers = score;
    final incorrectAnswers = userAnswers.where((a) => a != null).where((a) {
      final index = userAnswers.indexOf(a);
      return a != questions[index].correctIndex;
    }).length;
    final unanswered = userAnswers.where((a) => a == null).length;

    final performanceColor = AppTheme.getPerformanceColor(percentage);
    final performanceMessage = AppTheme.getPerformanceMessage(percentage);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Score Summary Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          performanceColor,
                          performanceColor.withOpacity(0.6),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: performanceColor.withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          _getPerformanceIcon(),
                          size: 64,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          performanceMessage,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '$score / ${questions.length}',
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${percentage.toStringAsFixed(1)}% Score',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Statistics Row
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.check_circle,
                          label: 'Correct',
                          value: correctAnswers.toString(),
                          color: AppTheme.successColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.cancel,
                          label: 'Wrong',
                          value: incorrectAnswers.toString(),
                          color: AppTheme.errorColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.help_outline,
                          label: 'Skipped',
                          value: unanswered.toString(),
                          color: AppTheme.warningColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // Section Header
                  Row(
                    children: [
                      Icon(
                        Icons.assessment_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Detailed Review',
                        style: theme.textTheme.headlineMedium,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Questions Review List
                  ...List.generate(questions.length, (i) {
                    final question = questions[i];
                    final originalQuestion = originalQuestions[i];
                    final userAnswerIndex = userAnswers[i];
                    final isCorrect =
                        userAnswerIndex != null &&
                        userAnswerIndex == question.correctIndex;
                    final isSkipped = userAnswerIndex == null;

                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.only(bottom: 16),
                      color: isCorrect
                          ? AppTheme.successColor.withOpacity(0.05)
                          : (isSkipped
                                ? AppTheme.warningColor.withOpacity(0.05)
                                : AppTheme.errorColor.withOpacity(0.05)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                          color: isCorrect
                              ? AppTheme.successColor.withValues(alpha: .3)
                              : (isSkipped
                                    ? AppTheme.warningColor.withValues(
                                        alpha: .3,
                                      )
                                    : AppTheme.errorColor.withValues(
                                        alpha: .3,
                                      )),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question Header
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isCorrect
                                        ? AppTheme.successColor
                                        : (isSkipped
                                              ? AppTheme.warningColor
                                              : AppTheme.errorColor),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    'Q${i + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    question.question,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                ),
                                Icon(
                                  isCorrect
                                      ? Icons.check_circle
                                      : (isSkipped
                                            ? Icons.help_outline
                                            : Icons.cancel),
                                  color: isCorrect
                                      ? AppTheme.successColor
                                      : (isSkipped
                                            ? AppTheme.warningColor
                                            : AppTheme.errorColor),
                                  size: 32,
                                ),
                              ],
                            ),

                            const Divider(height: 28),

                            // User Answer
                            _AnswerRow(
                              label: 'Your Answer:',
                              answer: userAnswerIndex == null
                                  ? 'Not Answered (Time Out)'
                                  : question.options[userAnswerIndex],
                              color: isCorrect
                                  ? AppTheme.successColor
                                  : (isSkipped
                                        ? AppTheme.warningColor
                                        : AppTheme.errorColor),
                              icon: isCorrect
                                  ? Icons.check_circle
                                  : (isSkipped
                                        ? Icons.timer_off
                                        : Icons.cancel),
                            ),

                            // Correct Answer (if wrong or skipped)
                            if (!isCorrect) ...[
                              const SizedBox(height: 12),
                              _AnswerRow(
                                label: 'Correct Answer:',
                                answer: originalQuestion.correctAnswer,
                                color: AppTheme.successColor,
                                icon: Icons.lightbulb_outline,
                              ),
                            ],

                            // Explanation
                            if (question.explanation != null) ...[
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surfaceBright,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        question.explanation!,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Bottom Action Buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizScreen(category: category),
                          ),
                        );
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry Quiz'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false,
                        );
                      },
                      icon: const Icon(Icons.home),
                      label: const Text('Home'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getPerformanceIcon() {
    if (percentage >= 80) return Icons.emoji_events;
    if (percentage >= 60) return Icons.thumb_up;
    if (percentage >= 40) return Icons.sentiment_satisfied;
    return Icons.sentiment_dissatisfied;
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: .3), width: 2),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnswerRow extends StatelessWidget {
  final String label;
  final String answer;
  final Color color;
  final IconData icon;

  const _AnswerRow({
    required this.label,
    required this.answer,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              children: [
                TextSpan(
                  text: '$label ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: answer,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
