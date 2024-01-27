import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  // state variables

  var currentinput = "0";
  var sign = [addSign, subtractSign, multiplySign, divideSign];
  static const addSign = "\u002B";
  static const subtractSign = "\u2212";
  static const multiplySign = "\u00D7";
  static const divideSign = "\u00F7";
  static const equalSign = "\u003D";

  void subCurrentInput(String input) {
    currentinput = currentinput.substring(0, currentinput.length - 1);
    currentinput += input;
  }

  bool endwith(List<String> x, String label) {
    for (String i in x) {
      if (currentinput.endsWith(i)) {
        subCurrentInput(label);
        return true;
      }
    }
    return false;
  }

  Widget buildRow({
    required int row,
  }) {
    if (row == 0) {
      return Expanded(
        child: Row(
          children: [buildItem(number: -1, label: 'C'), buildItem(number: -1, label: 'BACKSPACE')],
        ),
      );
    } else if (row == 1) {
      return Expanded(
        child: Row(
          children: [buildItem(number: 7), buildItem(number: 8), buildItem(number: 9), buildItem(number: -1, label: divideSign)],
        ),
      );
    } else if (row == 2) {
      return Expanded(
        child: Row(
          children: [buildItem(number: 4), buildItem(number: 5), buildItem(number: 6), buildItem(number: -1, label: multiplySign)],
        ),
      );
    } else if (row == 3) {
      return Expanded(
        child: Row(
          children: [buildItem(number: 1), buildItem(number: 2), buildItem(number: 3), buildItem(number: -1, label: subtractSign)],
        ),
      );
    } else if (row == 4) {
      return Expanded(
        child: Row(
          children: [buildItem(number: 0), buildItem(number: -1, label: addSign)],
        ),
      );
    } else if (row == 5) {
      return Expanded(
        child: Row(
          children: [buildItem(number: -1, label: equalSign)],
        ),
      );
    }
    return Container();
  }

  Widget buildItem({
    required int number,
    String label = "",
    Color color = Colors.black,
  }) {
    if (number > 0) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(3),
          child: Material(
            color: Colors.lightGreen,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (currentinput.length == 1 && currentinput == '0') {
                    currentinput = number.toString();
                  } else {
                    currentinput += number.toString();
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  number.toString(),
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (number == 0) {
      return Expanded(
        flex: 3,
        child: Container(
          padding: EdgeInsets.all(3),
          child: Material(
            color: Colors.lightGreen,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (!currentinput.startsWith('0')) {
                    currentinput += '0';
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  number.toString(),
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (number < 0 && label != equalSign && label != 'BACKSPACE') {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(3),
          child: Material(
            color: Colors.grey[200],
            child: InkWell(
              onTap: () {
                setState(() {
                  if (label == 'C') {
                    currentinput = '0';
                  } else if (label == divideSign && !currentinput.startsWith('0')) {
                    if (!endwith(sign, label)) {
                      currentinput += label;
                    }
                  } else if (label == addSign && !currentinput.startsWith('0')) {
                    if (!endwith(sign, label)) {
                      currentinput += label;
                    }
                  } else if (label == subtractSign && !currentinput.startsWith('0')) {
                    if (!endwith(sign, label)) {
                      currentinput += label;
                    }
                  } else if (label == multiplySign && !currentinput.startsWith('0')) {
                    if (!endwith(sign, label)) {
                      currentinput += label;
                    }
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  label.toString(),
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (label == equalSign) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(3),
          child: Material(
            color: Colors.blue,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentinput = '0';
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  label.toString(),
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(3),
          child: Material(
            color: Colors.grey[200],
            child: InkWell(
              onTap: () {
                setState(() {
                  if (label == 'BACKSPACE') {
                    currentinput = currentinput.substring(0, currentinput.length - 1);
                    if (currentinput.length == 0) {
                      currentinput = '0';
                    }
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Icon(Icons.backspace_outlined),
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                currentinput,
                style: TextStyle(fontSize: 40),
              ),
            ),
            buildRow(row: 0),
            buildRow(row: 1),
            buildRow(row: 2),
            buildRow(row: 3),
            buildRow(row: 4),
            buildRow(row: 5),
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
      shadowColor: Colors.grey,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calculate,
            color: Colors.green.shade600,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'MY CALCULATOR',
          )
        ],
      ));
}
