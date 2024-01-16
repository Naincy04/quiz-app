class QuizQuestion {
  final String question;
  final List<String> answers;

  List<String> getshuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }

  QuizQuestion({
    required this.question,
    required this.answers,
  });
}
