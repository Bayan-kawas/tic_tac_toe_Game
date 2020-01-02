import 'package:flutter/material.dart';
import 'cellContent.dart';
import 'main.dart';

class Result extends StatefulWidget {
  String message;

  Result(this.message);

  @override
  _ResultState createState() => _ResultState(this.message);
}

class _ResultState extends State<Result> {
  String message;

  _ResultState(this.message);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.tealAccent,
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Center(
              child: Text(
                "Tic Tac Toe",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  child: Container(
                    height: deviceWidth / 7,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        message,
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.pink),
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    restartGame(context);
                  },
                  color: Colors.grey,
                  child: Text(
                    "Restart Game",
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.black26),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  restartGame(context) {
    currentMark = "X";
    marks = [];
    fillMarks();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyGame(),
      ),
    );
  }
}
