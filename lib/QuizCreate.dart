// ignore_for_file: file_names, unused_import, prefer_const_constructors, deprecated_member_use, prefer_final_fields, avoid_print, unnecessary_string_interpolations, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:quizzler/Questions.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questions questionObject = Questions();

class QuizCreate extends StatefulWidget {
  const QuizCreate({Key key}) : super(key: key);

  @override
  _QuizCreateState createState() => _QuizCreateState();
}

class _QuizCreateState extends State<QuizCreate> {
  Box box;
  bool delete = false;
  final answerController = TextEditingController();
  final questionController = TextEditingController();
  String question = "";
  String answer = "";
  int questionNumber = 1;
  int questionNo = 0;
  int answerNo = 0;
  int counter = 1;
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

  void putQuestion() {
    box.put("question$questionNo", "$question");
  }

  void putAnswer() {
    box.put("answer$answerNo", "$answer");
  }

  void getQuestion() {
    print(box.get("question$questionNo"));
  }

  Widget buildQuestionTextField() => TextField(
        decoration: InputDecoration(
          hintText: "Enter Your Question",
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          label: Text(
            "Question",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        maxLines: 3,
        maxLength: 90,
        controller: questionController,
        onChanged: (value) {
          question = value;
        },
      );
  Widget builAnswerTextField() => TextField(
        decoration: InputDecoration(
          hintText: "Enter Your Answer In Boolean",
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          label: Text(
            "Answer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        controller: answerController,
        onChanged: (value) {
          answer = value;
        },
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                "Create Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "images/createquiz.png",
                      height: 150,
                      width: 300,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: buildQuestionTextField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: builAnswerTextField(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Question Number : $questionNumber",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[600],
                    highlightColor: Colors.cyan[600],
                    splashColor: Colors.cyan[800],
                    onPressed: () {
                      setState(() {
                        questionNo++;
                        answerNo++;
                        box.put("question$questionNo", "$question");
                        box.put("answer$answerNo", "$answer");
                        question = "";
                        answer = "";
                        counter++;
                        answerController.clear();
                        questionController.clear();
                        questionNumber++;
                      });
                    },
                    child: Card(
                      child: Text(
                        "    Add Question    ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[600],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[600],
                    highlightColor: Colors.cyan[600],
                    splashColor: Colors.cyan[800],
                    onPressed: () {
                      setState(() {
                        int tempQue = questionNumber - 1;
                        Alert(
                            style: AlertStyle(
                              titleStyle: TextStyle(
                                color: Colors.green[400],
                              ),
                              descStyle: TextStyle(
                                color: Colors.greenAccent[400],
                              ),
                            ),
                            context: context,
                            title: "Question Added Successfully !!!",
                            desc:
                                "You Added Total: $tempQue Questions Successfully !!!",
                            buttons: [
                              DialogButton(
                                  child: Text(
                                    "Back",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/");
                                  })
                            ]).show();
                      });
                    },
                    child: Card(
                      child: Text(
                        "    Finish    ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[600]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
