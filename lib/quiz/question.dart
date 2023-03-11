import 'package:game_client/quiz/option.dart';

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({required this.text, required this.options, this.isLocked = false, this.selectedOption});
}
