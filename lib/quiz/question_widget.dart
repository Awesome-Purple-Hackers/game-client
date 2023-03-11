import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_client/quiz/myquestion.dart';
import 'package:game_client/quiz/question.dart';
import 'package:game_client/quiz/question_fetcher.dart';
import 'package:game_client/routes.dart';
import 'package:get/get.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: FutureBuilder<String>(
              future: QuestionFetcher().fetchQuestion(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Question q = Question.fromJson(json.decode(snapshot.data!)[0]);
                  return MyQuestion(question: q);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          buildElevatedButton(),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Get.toNamed(Routes.result);
        });
      },
      child: Text("See the result"),
    );
  }
}
