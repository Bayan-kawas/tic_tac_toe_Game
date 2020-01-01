import 'package:flutter/material.dart';
import 'resultPage.dart';
String currentMark = "X";
List<List<String>> marks = [];
String winner;
fillMarks(){
  for (int i = 0; i < 3; i++) {
    marks.add([]);
    for (int j = 0; j < 3; j++) {
      marks[i].add('');
    }
  }
}

class Cell extends StatefulWidget {
  @override
  int i, j;

  Cell(this.i, this.j);

  _CellState createState() => _CellState(this.i, this.j);
}

class _CellState extends State<Cell> {
  String mark = "";
  int i, j;

  _CellState(this.i, this.j);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: deviceWidth / 8,
        height: deviceWidth / 8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26,width:1.2),),
        child: InkWell(
          child: Center(
              child: Text(
                mark,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          onTap: () {
            if (mark != '') {
              return;
            }
            setState(() {
              this.mark = currentMark;
            });
            marks[i][j] = mark;
            if (currentMark == 'X') {
              currentMark = 'O';
            } else {
              currentMark = 'X';
            }
             winner = whoWins();
            if (winner != '') {
             Navigator.push(context, MaterialPageRoute(
              builder: (context) => Result(mark)),
             );
            }
          },
        ),
      ),
    );
  }
}

String whoWins() {
  // check rows
  String mark = '';
  for (int row = 0; row < 3; row++) {
    int col;
    for (col = 0; col < 3; col++) {
      if (mark != '' && mark != marks[row][col]) {
        break;
      }
      mark = marks[row][col];
    }
    if (col == 3) {
      return mark;
    }
    mark = "";
  }

  // check columns
  mark = '';
  for (int col = 0; col < 3; col++) {
    int row;
    for (row = 0; row < 3; row++) {
      if (mark != '' && mark != marks[row][col]) {
        break;
      }

      mark = marks[row][col];
    }
    if (row == 3) {
      return mark;
    }
    mark = "";
  }
  // Check simple diagonal
  mark = '';
  int i;
  for (i = 0; i < 3; i++) {
    if (mark != '' && mark != marks[i][i]) {
      break;
    }
    mark = marks[i][i];
  }

  if (i == 3) {
    return mark;
  }

  // check other diagonal
  mark = '';

  for (i = 0; i < 3; i++) {
    if (mark != '' && mark != marks[i][2 - i]) {
      break;
    }
    mark = marks[i][2 - i];
  }
  if (i == 3) {
    return mark;
  }

  return '';
}
