import 'package:flutter/material.dart';
import 'cellContent.dart';

void main() {
  fillMarks();
  runApp(MaterialApp(
    home: MyGame(),
  ));
}

class MyGame extends StatefulWidget {
  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
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
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width:deviceWidth/2,
                height:deviceWidth/2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Cell(0, 0),
                          Cell(0, 1),
                          Cell(0, 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Cell(1, 0),
                          Cell(1, 1),
                          Cell(1, 2),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Cell(2, 0),
                          Cell(2, 1),
                          Cell(2, 2),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
