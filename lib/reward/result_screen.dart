import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  static Uri uri = Uri(scheme: 'https', host: 'app.genez.io', path: '/project/a2c31b93-c503-4345-abe8-ee6eeffe0e72');

  ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String postUrl = "https://6ix5m63wbo2ilup2arzisublzu0isdcz.lambda-url.us-east-1.on.aws/";

  Future<String> mintItem() async {
    http.Response response = await http.post(
      Uri.parse(postUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'jsonrpc': "2.0",
        'method': "MultiversXService.mintNft",
        'params': ["asdasdas", 42],
        'id': '3'
      }),
    );
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: mintItem(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          print(snapshot.data!);
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(child: Text(snapshot.data!)),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
