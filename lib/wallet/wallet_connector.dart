import 'package:url_launcher/url_launcher.dart';

class WalletConnector {
  static Uri uri = Uri(scheme: 'https', host: 'mvx-front-git-main-awesome-hackers.vercel.app', path: '/');

  static launchURL() async {
    launchUrl(uri);
  }
}
