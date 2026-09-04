import 'package:flutter/material.dart';

import '../models/clue_question.dart';
import 'clue_quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final String category;
  final int score;
  final int correct;
  final int total;
  final List<ClueQuestion> sourceQuestions;

  const ResultScreen({
    super.key,
    required this.category,
    required this.score,
    required this.correct,
    required this.total,
    required this.sourceQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final accuracy = total == 0 ? 0 : ((correct / total) * 100).round();
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Column(
                children: [
                  Container(
                    width: 92,
                    height: 92,
                    decoration: BoxDecoration(
                      color: scheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.emoji_events_rounded, size: 50, color: scheme.primary),
                  ),
                  const SizedBox(height: 20),
                  Text('Challenge complete!', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(category, style: TextStyle(color: scheme.onSurfaceVariant)),
                  const SizedBox(height: 28),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: scheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: Column(
                      children: [
                        Text('$score', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: scheme.primary)),
                        const Text('POINTS', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.4)),
                        const SizedBox(height: 22),
                        Row(
                          children: [
                            Expanded(child: _ResultStat(label: 'Correct', value: '$correct/$total')),
                            const SizedBox(width: 12),
                            Expanded(child: _ResultStat(label: 'Accuracy', value: '$accuracy%')),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(_message(accuracy), textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, height: 1.4, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => ClueQuizScreen(category: category, sourceQuestions: sourceQuestions),
                          ),
                        );
                      },
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Play Again'),
                      style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.home_rounded),
                      label: const Text('Back to Home'),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _message(int accuracy) {
    if (accuracy == 100) return 'Perfect! You solved every mystery.';
    if (accuracy >= 80) return 'Excellent! Your Bangladesh knowledge is strong.';
    if (accuracy >= 60) return 'Nice work. A second round could push your score higher.';
    return 'Good start. Reveal clues carefully and try another round.';
  }
}

class _ResultStat extends StatelessWidget {
  final String label;
  final String value;
  const _ResultStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
