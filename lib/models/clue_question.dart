class ClueQuestion {
  final String category;
  final String answer;
  final List<String> clues;
  final List<String> options;
  final String explanation;

  const ClueQuestion({
    required this.category,
    required this.answer,
    required this.clues,
    required this.options,
    required this.explanation,
  });
}
