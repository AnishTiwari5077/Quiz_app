import 'package:flutter/material.dart';
import 'package:quiz_app/constant/app_theme.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categories = quizData.keys.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Master'), elevation: 0),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.primary.withOpacity(0.1),
              theme.colorScheme.background,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Welcome Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.school,
                          size: 64,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Welcome to Quiz Master!',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Test your knowledge across various categories',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Section Title
                Row(
                  children: [
                    Icon(
                      Icons.category,
                      color: theme.colorScheme.primary,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Choose a Category',
                      style: theme.textTheme.headlineMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Category Cards
                ...List.generate(categories.length, (index) {
                  final category = categories[index];
                  final questionCount = quizData[category]!.length;
                  final icon = _getCategoryIcon(category);
                  final color = _getCategoryColor(index);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CategoryCard(
                      category: category,
                      questionCount: questionCount,
                      icon: icon,
                      color: color,
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
                }),

                const SizedBox(height: 16),

                // Info Card
                Card(
                  color: AppTheme.secondaryColor.withOpacity(0.1),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: AppTheme.secondaryColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: AppTheme.secondaryColor,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiz Rules',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppTheme.secondaryColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '• 15 seconds per question\n• Answer options are shuffled\n• Review all answers at the end',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'general knowledge':
        return Icons.public;
      case 'technology':
        return Icons.computer;
      case 'science':
        return Icons.science;
      case 'history':
        return Icons.history_edu;
      case 'sports':
        return Icons.sports_soccer;
      case 'geography':
        return Icons.map;
      default:
        return Icons.quiz;
    }
  }

  Color _getCategoryColor(int index) {
    final colors = [
      AppTheme.primaryColor,
      AppTheme.successColor,
      AppTheme.warningColor,
      AppTheme.secondaryColor,
      const Color(0xFF9C27B0),
      const Color(0xFFE91E63),
    ];
    return colors[index % colors.length];
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final int questionCount;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const CategoryCard({
    required this.category,
    required this.questionCount,
    required this.icon,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.quiz, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '$questionCount Questions',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward, color: color, size: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
