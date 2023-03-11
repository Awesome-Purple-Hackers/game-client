import 'dart:convert';

import 'package:game_client/quiz/question.dart';
import 'package:http/http.dart' as http;

class QuestionFetcher {
  String url = 'https://tbh.ideacat.ro/api/openai/quizzes';

  Future<String> fetchQuestion() async {
    var response = await http.get(Uri.parse(url));
    return response.body;
    // return Question.fromJson(json.decode(response.body)[0]);
  }
}
