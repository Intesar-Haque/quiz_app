class Quiz {
  final String question;
  final Map<String, bool> choices;
  const Quiz({
    required this.question,
    required this.choices
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      question: json['question'],
      choices: Map.from(json['answers']),
    );
  }
}