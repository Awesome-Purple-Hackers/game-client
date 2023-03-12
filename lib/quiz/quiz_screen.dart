import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game_client/quiz/question_widget.dart';
import 'package:game_client/quiz/model/question.dart';
import 'package:game_client/quiz/question_api.dart';
import 'package:game_client/routes.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    // Trigger a refresh of the FutureBuilder when the user pulls down the screen
                    setState(() {});
                  },
                  child: FutureBuilder<String>(
                    future: QuestionApi().fetchQuestion(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var decode;
                        try {
                          decode = json.decode(snapshot.data!)[0];
                          Question q = Question.fromJson(decode);
                          return QuestionWidget(question: q);
                        } catch (e) {
                          return Center(
                              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "This villan is busy right now, Please try another room!",
                                style: TextStyle(fontSize: 18),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                  // setState(() {});
                                },
                                child: Text("Go back"),
                              ),
                            ],
                          ));
                        }
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              buildElevatedButton(),
              const SizedBox(height: 20)
            ],
          ),
        ),
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
      child: Text("Claim reward"),
    );
  }
}
