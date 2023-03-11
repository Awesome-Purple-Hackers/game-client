import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> fetchAccountBalance() async {
    var response = await http.get(Uri.parse('http://localhost:8080/connectWallet'));
    return response.body;
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
          ],
        ),
      ),
    );
  }
}
