import 'package:game_client/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = '/home';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => const HomeScreen(
              title: 'Home',
            )),
  ];
}
