// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "About Us",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      "images/rafi.jpeg",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {},
                    child: Card(
                      color: Colors.cyan[100],
                      child: Text(
                        "Muhammad Fazlul karim",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {},
                    child: Card(
                      color: Colors.cyan[100],
                      child: Text(
                        "Internationtional Islamic University Chittagong",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {},
                    child: Card(
                      color: Colors.cyan[100],
                      child: Container(
                        height: 50,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "----->        rafidiya143@gmail.com",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {},
                    child: Card(
                      color: Colors.cyan[100],
                      child: Container(
                        height: 50,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "----->        01888303025",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {},
                    child: Card(
                      color: Colors.cyan[100],
                      child: Container(
                        height: 50,
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Facebook",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Pacifico",
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "----->        rafipsv",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {},
                    child: Card(
                      color: Colors.cyan[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Instagram",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Pacifico",
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            "----->        the_rafiology_d",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Pacifico",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    hoverColor: Colors.cyan[200],
                    highlightColor: Colors.cyan[200],
                    splashColor: Colors.cyan[800],
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Card(
                      color: Colors.cyan[100],
                      child: Text(
                        "Back To Home",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Sanspro",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 4,
                        ),
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
