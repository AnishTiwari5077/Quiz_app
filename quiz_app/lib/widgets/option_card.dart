import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final bool showAnswer;
  final VoidCallback onTap;

  const OptionCard({
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.showAnswer,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      if (!showAnswer) {
        return isSelected ? Colors.blue.shade100 : Colors.white;
      }
      // Show answer mode
      if (isCorrect) {
        return Colors.green.shade100;
      }
      if (isSelected && !isCorrect) {
        return Colors.red.shade100;
      }
      return Colors.grey.shade50;
    }

    Color getBorderColor() {
      if (!showAnswer) {
        return isSelected ? Colors.blue : Colors.grey.shade300;
      }
      // Show answer mode
      if (isCorrect) {
        return Colors.green;
      }
      if (isSelected && !isCorrect) {
        return Colors.red;
      }
      return Colors.grey.shade300;
    }

    IconData? getIcon() {
      if (!showAnswer) return null;
      if (isCorrect) return Icons.check_circle;
      if (isSelected && !isCorrect) return Icons.cancel;
      return null;
    }

    Color? getIconColor() {
      if (!showAnswer) return null;
      if (isCorrect) return Colors.green.shade700;
      if (isSelected && !isCorrect) return Colors.red.shade700;
      return null;
    }

    double getBorderWidth() {
      if (!showAnswer && isSelected) return 2.5;
      if (showAnswer && (isCorrect || (isSelected && !isCorrect))) return 2.5;
      return 1.5;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: showAnswer ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.blue.withOpacity(0.2),
          highlightColor: Colors.blue.withOpacity(0.1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: getBackgroundColor(),
              border: Border.all(
                color: getBorderColor(),
                width: getBorderWidth(),
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow:
                  (showAnswer && isCorrect) || (isSelected && !showAnswer)
                  ? [
                      BoxShadow(
                        color: getBorderColor().withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected || (showAnswer && isCorrect)
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                if (getIcon() != null) ...[
                  const SizedBox(width: 12),
                  AnimatedScale(
                    scale: showAnswer ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.elasticOut,
                    child: Icon(getIcon(), color: getIconColor(), size: 28),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
