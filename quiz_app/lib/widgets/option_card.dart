import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final bool showAnswer;
  final VoidCallback onTap;

  const OptionCard({
    required this.option,
    required this.onTap,
    this.isSelected = false,
    this.isCorrect = false,
    this.showAnswer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (!showAnswer) return Colors.grey.shade200;
      if (isSelected && isCorrect) return Colors.green;
      if (isSelected && !isCorrect) return Colors.red;
      if (!isSelected && isCorrect) return Colors.green.shade200;
      return Colors.grey.shade200;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(option, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
