class Question {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String? explanation;

  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    this.explanation,
  });

  Question shuffleOptions() {
    final List<MapEntry<int, String>> indexedOptions = [];
    for (int i = 0; i < options.length; i++) {
      indexedOptions.add(MapEntry(i, options[i]));
    }

    indexedOptions.shuffle();

    int newCorrectIndex = 0;
    final List<String> shuffledOptions = [];

    for (int i = 0; i < indexedOptions.length; i++) {
      shuffledOptions.add(indexedOptions[i].value);
      if (indexedOptions[i].key == correctIndex) {
        newCorrectIndex = i;
      }
    }

    return Question(
      question: question,
      options: shuffledOptions,
      correctIndex: newCorrectIndex,
      explanation: explanation,
    );
  }

  String get correctAnswer => options[correctIndex];

  bool isCorrect(int index) => index == correctIndex;
}
