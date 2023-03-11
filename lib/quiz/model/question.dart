import 'package:game_client/quiz/model/option.dart';

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({required this.text, required this.options, this.isLocked = false, this.selectedOption});

  Question.fromJson(Map<String, dynamic> json, {this.isLocked = false})
      : this.text = json['question'],
        this.options = List<Option>.from(json['options'].map((option) => Option.fromJson(option)).toList());

  Map<String, dynamic> toJson() => {
        'question': this.text,
        'options': this.options,
      };
}
