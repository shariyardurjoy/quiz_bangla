import 'dart:math';

import 'package:flutter/material.dart';

import '../models/clue_question.dart';
import 'result_screen.dart';

class ClueQuizScreen extends StatefulWidget {
  final String category;
  final List<ClueQuestion> sourceQuestions;

  const ClueQuizScreen({
    super.key,
    required this.category,
    required this.sourceQuestions,
  });

  @override
  State<ClueQuizScreen> createState() => _ClueQuizScreenState();
}

class _ClueQuizScreenState extends State<ClueQuizScreen> {
  late final List<ClueQuestion> _questions;
  late final List<List<String>> _optionOrders;
  int _index = 0;
  int _clueIndex = 0;
  int _score = 0;
  int _correct = 0;
  int _firstClueSolves = 0;
  int _streak = 0;
  bool _showOptions = false;
  bool _locked = false;
  String? _selected;

  static const _points = [100, 70, 40];

  @override
  void initState() {
    super.initState();
    final random = Random();
    final shuffled = [...widget.sourceQuestions]..shuffle(random);
    _questions = shuffled.take(min(10, shuffled.length)).toList();
    _optionOrders = _questions.map((q) {
      final options = [...q.options]..shuffle(random);
      return options;
    }).toList();
  }

  ClueQuestion get _question => _questions[_index];
  int get _potentialPoints => _points[_clueIndex];
  List<String> get _currentOptions => _optionOrders[_index];

  String get _challengePrompt {
    final category = _question.category;
    if (category == 'Bangladesh Places') return 'WHICH PLACE AM I?';
    if (category == 'Famous People') return 'WHO AM I?';
    return 'WHAT AM I?';
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('No questions are available yet.')),
      );
    }

    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('$_score pts', style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            minHeight: 8,
                            value: (_index + 1) / _questions.length,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('${_index + 1}/${_questions.length}', style: const TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _StatusChip(icon: Icons.stars_rounded, label: '$_potentialPoints pts'),
                      const SizedBox(width: 8),
                      _StatusChip(icon: Icons.local_fire_department_rounded, label: '$_streak streak'),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    _challengePrompt,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: scheme.primary, fontWeight: FontWeight.w900, letterSpacing: 1.3),
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                      decoration: BoxDecoration(
                        color: scheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(_question.category, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(_clueIndex + 1, (i) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: i == _clueIndex ? scheme.primaryContainer : scheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: i == _clueIndex ? scheme.primary : scheme.outlineVariant,
                            foregroundColor: i == _clueIndex ? scheme.onPrimary : scheme.onSurfaceVariant,
                            child: Text('${i + 1}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900)),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              _question.clues[i],
                              style: const TextStyle(fontSize: 17, height: 1.35, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 6),
                  if (!_showOptions) ...[
                    FilledButton.icon(
                      onPressed: () => setState(() => _showOptions = true),
                      icon: const Icon(Icons.psychology_alt_rounded),
                      label: Text('Guess now for $_potentialPoints points'),
                      style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      onPressed: _clueIndex < 2 ? _revealNextClue : null,
                      icon: const Icon(Icons.visibility_rounded),
                      label: Text(_clueIndex < 2 ? 'Reveal Clue ${_clueIndex + 2}' : 'All clues revealed'),
                      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                    ),
                    if (_clueIndex < 2)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Revealing another clue lowers the value of this question.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: scheme.onSurfaceVariant),
                        ),
                      ),
                  ] else ...[
                    Text('Choose your answer', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    ..._currentOptions.map((option) => _AnswerButton(
                          label: option,
                          selected: _selected == option,
                          correctAnswer: _locked ? _question.answer : null,
                          locked: _locked,
                          onTap: _locked ? null : () => _answer(option),
                        )),
                    if (_locked) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: scheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(_question.explanation, style: const TextStyle(height: 1.35)),
                      ),
                      const SizedBox(height: 14),
                      FilledButton(
                        onPressed: _next,
                        style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                        child: Text(_index == _questions.length - 1 ? 'See Result' : 'Next Mystery'),
                      ),
                    ] else ...[
                      const SizedBox(height: 6),
                      TextButton.icon(
                        onPressed: () => setState(() => _showOptions = false),
                        icon: const Icon(Icons.arrow_back_rounded),
                        label: const Text('Back to clues'),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _revealNextClue() {
    if (_clueIndex >= 2) return;
    setState(() {
      _clueIndex++;
      _showOptions = false;
    });
  }

  void _answer(String option) {
    final isCorrect = option == _question.answer;
    int earned = 0;
    setState(() {
      _selected = option;
      _locked = true;
      if (isCorrect) {
        earned = _potentialPoints;
        _correct++;
        if (_clueIndex == 0) _firstClueSolves++;
        _streak++;
        if (_streak % 3 == 0) earned += 20;
        _score += earned;
      } else {
        _streak = 0;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          isCorrect
              ? 'Nice! +$earned points${_streak > 0 && _streak % 3 == 0 ? ' • streak bonus!' : ''}'
              : 'Not this time. The answer is ${_question.answer}.',
        ),
        duration: const Duration(milliseconds: 1400),
      ),
    );
  }

  void _next() {
    if (_index == _questions.length - 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            category: widget.category,
            score: _score,
            correct: _correct,
            total: _questions.length,
            firstClueSolves: _firstClueSolves,
            sourceQuestions: widget.sourceQuestions,
          ),
        ),
      );
      return;
    }

    setState(() {
      _index++;
      _clueIndex = 0;
      _showOptions = false;
      _locked = false;
      _selected = null;
    });
  }
}

class _StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatusChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
        ],
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  final String label;
  final bool selected;
  final String? correctAnswer;
  final bool locked;
  final VoidCallback? onTap;

  const _AnswerButton({
    required this.label,
    required this.selected,
    required this.correctAnswer,
    required this.locked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? background;
    Color? border;
    IconData? trailing;

    if (locked && label == correctAnswer) {
      background = scheme.primaryContainer;
      border = scheme.primary;
      trailing = Icons.check_circle_rounded;
    } else if (locked && selected) {
      background = scheme.errorContainer;
      border = scheme.error;
      trailing = Icons.cancel_rounded;
    } else if (selected) {
      background = scheme.secondaryContainer;
      border = scheme.secondary;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: background ?? scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: border ?? scheme.outlineVariant),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: [
                Expanded(child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700))),
                if (trailing != null) Icon(trailing, color: border),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
