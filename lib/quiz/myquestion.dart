import 'package:flutter/material.dart';
import 'package:game_client/quiz/options_widget.dart';
import 'package:game_client/quiz/question.dart';

class MyQuestion extends StatefulWidget {
  MyQuestion({Key? key, required this.question}) : super(key: key);
  final Question question;

  @override
  State<MyQuestion> createState() => _MyQuestionState();
}

class _MyQuestionState extends State<MyQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(widget.question.text, style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 32),
        Expanded(
            child: OptionsWidget(
          question: widget.question,
          onClickedOption: (option) {
            if (widget.question.isLocked) {
              return;
            } else {
              setState(() {
                widget.question.isLocked = true;
                widget.question.selectedOption = option;
              });
            }
          },
        )),
      ],
    );
  }
}
