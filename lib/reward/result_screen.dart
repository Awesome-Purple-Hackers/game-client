import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatelessWidget {
  static Uri uri = Uri(scheme: 'https', host: 'app.genez.io', path: '/project/a2c31b93-c503-4345-abe8-ee6eeffe0e72');

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            launchUrl(uri);
          },
          child: Text("Claim Reward"),
        ),
      ),
    );
  }
}
