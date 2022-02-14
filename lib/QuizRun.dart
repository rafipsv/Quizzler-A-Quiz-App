// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace, annotate_overrides, unused_import, avoid_print, missing_required_param

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizzler/Questions.dart';
import 'package:quizzler/QuizCreate.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizRun extends StatefulWidget {
  const QuizRun({Key key}) : super(key: key);

  @override
  _QuizRunState createState() => _QuizRunState();
}

class _QuizRunState extends State<QuizRun> {
  Box box;
  int rightAnswer = 0;
  int wrongAnswer = 0;
  int questionNo = 1;
  int answerNo = 1;
  int counter = 0;
  String question = "Press Start to Enter Quiz";
  String answer;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future openBox() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox('QuizBox');
    return;
  }

  Widget displayQuestion() => Text(box.get("question$questionNo"));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text("Quiz"),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Image(
                    height: 150,
                    width: 200,
                    image: AssetImage(
                      "images/quiz.jpeg",
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        hoverColor: Colors.green[400],
                        highlightColor: Colors.green[400],
                        splashColor: Colors.greenAccent,
                        color: Colors.green[900],
                        onPressed: () {
                          setState(() {
                            question = box.get("question$questionNo");
                            answer = box.get("answer$answerNo");

                            if (answer == "true" || answer == "True") {
                              rightAnswer++;
                            } else {
                              wrongAnswer++;
                            }
                            counter++;
                            if (counter * 2 == box.length) {
                              Alert(
                                  style: AlertStyle(
                                      titleStyle:
                                          TextStyle(color: Colors.green[400])),
                                  context: context,
                                  title: "Finished",
                                  desc:
                                      "Total Score Right Answer: $rightAnswer\nWrong Answer: $wrongAnswer",
                                  buttons: [
                                    DialogButton(
                                        child: Text(
                                          "Finish",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, "/");
                                        })
                                  ]).show();
                              question =
                                  "You are Done With It\nPlease Press Back Button";
                              questionNo = 1;
                              answerNo = 1;
                            }
                            answerNo++;
                            questionNo++;
                          });
                        },
                        child: Center(
                          child: Card(
                            color: Colors.green[900],
                            elevation: 5,
                            child: Container(
                              height: 30,
                              width: 90,
                              child: Center(
                                child: Text(
                                  "True",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FlatButton(
                        hoverColor: Colors.red[400],
                        highlightColor: Colors.red[400],
                        splashColor: Colors.red[50],
                        color: Colors.red[900],
                        onPressed: () {
                          setState(() {
                            question = box.get("question$questionNo");
                            answer = box.get("answer$answerNo");
                            if (answer == "false" || answer == "False") {
                              rightAnswer++;
                            } else {
                              wrongAnswer++;
                            }
                            counter++;
                            if (counter * 2 == box.length) {
                              Alert(
                                  style: AlertStyle(
                                      titleStyle:
                                          TextStyle(color: Colors.green[400])),
                                  context: context,
                                  title: "Finished",
                                  desc:
                                      "Total Score Right Answer: $rightAnswer\nWrong Answer: $wrongAnswer",
                                  buttons: [
                                    DialogButton(
                                        child: Text(
                                          "Finish",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(context, "/");
                                        })
                                  ]).show();
                              question =
                                  "You are Done With It\nPlease Press Back Button";
                              questionNo = 1;
                              answerNo = 1;
                            }
                            answerNo++;
                            questionNo++;
                          });
                        },
                        child: Center(
                          child: Card(
                            color: Colors.red[900],
                            elevation: 5,
                            child: Container(
                              height: 30,
                              width: 90,
                              child: Center(
                                child: Text(
                                  "False",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      color: Colors.green[900],
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$rightAnswer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Icon(
                      Icons.close,
                      color: Colors.red[900],
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$wrongAnswer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {
                      setState(() {
                        question = box.get("question$questionNo");
                        answer = box.get("answer$answerNo");
                        questionNo++;
                      });
                    },
                    child: Center(
                      child: Card(
                        color: Colors.cyan[400],
                        child: Container(
                          height: 30,
                          width: 90,
                          color: Colors.cyan[400],
                          child: Center(
                            child: Text(
                              "Start",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, "/");
                      });
                    },
                    child: Center(
                      child: Card(
                        color: Colors.cyan[400],
                        child: Container(
                          height: 30,
                          width: 90,
                          color: Colors.cyan[400],
                          child: Center(
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
