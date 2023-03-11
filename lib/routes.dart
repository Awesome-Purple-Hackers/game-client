import 'package:game_client/game/game_screen.dart';
import 'package:game_client/home_screen.dart';
import 'package:game_client/quiz/quiz_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = '/home';
  static const String game = '/game';
  static const String quiz = '/quiz';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => const HomeScreen(
              title: 'Home',
            )),
    GetPage(name: game, page: () => GameScreen()),
    GetPage(name: quiz, page: () => QuizScreen()),
  ];
}
