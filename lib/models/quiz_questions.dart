class QuizQuestion {
  final String question;
  final List<String> answers;

  List<String> getshuffledAnswers() {
    final _shuffledAnswers = List.of(answers);
    _shuffledAnswers.shuffle();
    return _shuffledAnswers;
  }

  QuizQuestion({
    required this.question,
    required this.answers,
  });
}
