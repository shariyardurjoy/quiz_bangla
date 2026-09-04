import 'package:flutter/material.dart';

import '../data/question_bank.dart';
import 'clue_quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = [
    _CategoryInfo('Bangladesh Places', Icons.location_on_rounded, 'Landmarks, districts & heritage'),
    _CategoryInfo('Food & Culture', Icons.ramen_dining_rounded, 'Taste, traditions & festivals'),
    _CategoryInfo('Famous People', Icons.person_search_rounded, 'Writers, artists & achievers'),
    _CategoryInfo('Sports', Icons.sports_cricket_rounded, 'Cricket, football & more'),
    _CategoryInfo('Mystery Mix', Icons.auto_awesome_rounded, 'A surprise from every category'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TopBar(
                        onHowToPlay: () => _showHowToPlay(context),
                        onSettings: () => Navigator.pushNamed(context, '/settings'),
                      ),
                      const SizedBox(height: 28),
                      _HeroCard(onStart: () => _startQuiz(context, 'Mystery Mix')),
                      const SizedBox(height: 30),
                      Text(
                        'Choose your challenge',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Reveal fewer clues to earn more points.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: 18),
                      Wrap(
                        spacing: 14,
                        runSpacing: 14,
                        children: _categories.map((category) {
                          final width = constraints.maxWidth >= 680
                              ? (constraints.maxWidth.clamp(0, 860) - 14) / 2
                              : constraints.maxWidth;
                          return SizedBox(
                            width: width.toDouble(),
                            child: _CategoryCard(
                              info: category,
                              onTap: () => _startQuiz(context, category.title),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, String category) {
    final available = category == 'Mystery Mix'
        ? clueQuestions
        : clueQuestions.where((q) => q.category == category).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ClueQuizScreen(
          category: category,
          sourceQuestions: available,
        ),
      ),
    );
  }

  void _showHowToPlay(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 4, 24, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How to play', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 18),
            const _RuleRow(icon: Icons.looks_one_rounded, text: 'Start with Clue 1. Guess early if you are confident.'),
            const _RuleRow(icon: Icons.visibility_rounded, text: 'Reveal more clues when you need help.'),
            const _RuleRow(icon: Icons.stars_rounded, text: 'Score 100, 70, or 40 points depending on when you guess.'),
            const _RuleRow(icon: Icons.local_fire_department_rounded, text: 'Every 3 correct answers in a row earns a 20-point streak bonus.'),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final VoidCallback onHowToPlay;
  final VoidCallback onSettings;
  const _TopBar({required this.onHowToPlay, required this.onSettings});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.lightbulb_rounded, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('QuizBangla', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
              Text('Think before you reveal', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        IconButton.filledTonal(
          onPressed: onHowToPlay,
          tooltip: 'How to play',
          icon: const Icon(Icons.help_outline_rounded),
        ),
        const SizedBox(width: 8),
        IconButton.filledTonal(
          onPressed: onSettings,
          tooltip: 'Settings',
          icon: const Icon(Icons.settings_rounded),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  final VoidCallback onStart;
  const _HeroCard({required this.onStart});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, const Color(0xFF0A845F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 18,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CLUE CHALLENGE', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
                SizedBox(height: 8),
                Text('How quickly can you guess it?', style: TextStyle(color: Colors.white, fontSize: 30, height: 1.1, fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                Text('Three clues. One answer. Fewer clues = more points.', style: TextStyle(color: Colors.white70, fontSize: 15)),
              ],
            ),
          ),
          FilledButton.icon(
            onPressed: onStart,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: scheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Start Mystery Mix', style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final _CategoryInfo info;
  final VoidCallback onTap;
  const _CategoryCard({required this.info, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(info.icon, color: scheme.onPrimaryContainer),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(info.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(info.subtitle, style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}

class _RuleRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _RuleRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class _CategoryInfo {
  final String title;
  final IconData icon;
  final String subtitle;
  const _CategoryInfo(this.title, this.icon, this.subtitle);
}
