// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box box;
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Text(
                "Welcome To HomePage",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              hoverColor: Colors.cyan[200],
              highlightColor: Colors.cyan[200],
              splashColor: Colors.cyan[800],
              onPressed: () {
                Navigator.pushNamed(context, "/create");
              },
              child: Center(
                child: Card(
                  color: Colors.cyan[200],
                  child: Container(
                    height: 40,
                    width: 120,
                    color: Colors.cyan[200],
                    child: Center(
                      child: Text(
                        "Create Quiz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              hoverColor: Colors.cyan[200],
              highlightColor: Colors.cyan[200],
              splashColor: Colors.cyan[800],
              onPressed: () {
                Navigator.pushNamed(context, "/quizrun");
              },
              child: Center(
                child: Card(
                  color: Colors.cyan[200],
                  child: Container(
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Start Quiz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              hoverColor: Colors.cyan[200],
              highlightColor: Colors.cyan[200],
              splashColor: Colors.cyan[800],
              onPressed: () {
                box.clear();
                Alert(
                    style: AlertStyle(
                      titleStyle: TextStyle(
                        color: Colors.red,
                      ),
                      descStyle: TextStyle(
                        color: Colors.red[900],
                      ),
                    ),
                    context: context,
                    title: "Deleted",
                    desc: "Your Current Quiz Is Deleted Successfully !!!",
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
              },
              child: Center(
                child: Card(
                  color: Colors.cyan[200],
                  child: Container(
                    height: 80,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Delete Current Quiz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              hoverColor: Colors.cyan[200],
              highlightColor: Colors.cyan[200],
              splashColor: Colors.cyan[800],
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/aboutus");
                });
              },
              child: Center(
                child: Card(
                  color: Colors.cyan[200],
                  child: Container(
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "About Us",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
    );
  }
}
