import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uri uri = Uri(scheme: 'https', host: 'mvx-front-git-main-awesome-hackers.vercel.app', path: '/');

  Future<String> fetchAccountBalance() async {
    var response = await http.get(Uri.parse('http://localhost:8080/connectWallet'));
    return response.body;
  }

  launchURL(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String>(
              future: fetchAccountBalance(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  launchUrl(uri);
                },
                child: Text("View Profile"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
