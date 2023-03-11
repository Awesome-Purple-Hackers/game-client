class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});

  Option.fromJson(Map<String, dynamic> json)
      : text = json['answer'],
        isCorrect = json['isCorrect'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'isCorrect': isCorrect,
      };
}
