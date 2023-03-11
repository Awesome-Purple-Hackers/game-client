import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:game_client/main.dart';
import 'package:game_client/quiz/question.dart';

void main() {
  Map<String, dynamic> json = {
    "question": "What is the square root of 9?",
    "options": [
      {"answer": "minVersionAndroid", "isCorrect": true},
      {"answer": "minVersionAndroid", "isCorrect": true},
      {"answer": "minVersionAndroid", "isCorrect": true},
      {"answer": "minVersionAndroid", "isCorrect": true},
    ]
  };

  test('object has correct properties', () {
    final questoin = Question.fromJson(json);
    Map<String, dynamic> sss = questoin.toJson();

    expect(questoin.text, "aaaa");
  });
}
