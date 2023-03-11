import 'package:http/http.dart' as http;

class QuestionApi {
  String url = 'https://tbh.ideacat.ro/api/openai/quizzes';

  Future<String> fetchQuestion() async {
    var response = await http.get(Uri.parse(url));
    print(response.body);
    return response.body;
  }
}
