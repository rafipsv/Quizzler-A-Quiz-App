// ignore_for_file: prefer_const_constructors, unused_import, await_only_futures, unnecessary_import

import 'package:flutter/material.dart';
import 'package:quizzler/AboutUs.dart';
import 'package:quizzler/QuizCreate.dart';
import 'package:quizzler/QuizRun.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(    
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "HomePage",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: SafeArea(
            child: HomePage(),
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/aboutus": (context) => AboutUs(),
        "/create": (context) => QuizCreate(),
        "/quizrun": (context) => QuizRun(),
      },
    );
  }
}
