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
  var newInput = "";

  static const addSign = "\u002B";
  static const subtractSign = "\u2212";
  static const multiplySign = "\u00D7";
  static const divideSign = "\u00F7";
  static const equalSign = "\u003D";

  Widget buildItem({
    required int number,
    String label = "",
    // required String label,
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
                    if (currentinput.endsWith(multiplySign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += divideSign;
                    } else if (currentinput.endsWith(addSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += divideSign;
                    } else if (currentinput.endsWith(subtractSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += divideSign;
                    } else if (!currentinput.endsWith(divideSign)) {
                      currentinput += divideSign;
                    }
                  } else if (label == addSign && !currentinput.startsWith('0')) {
                    if (currentinput.endsWith(divideSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += addSign;
                    } else if (currentinput.endsWith(multiplySign)) {
                      currentinput = currentinput.substring(0, currentinput.length - multiplySign.length);
                      currentinput += addSign;
                    } else if (currentinput.endsWith(divideSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += addSign;
                    } else if (currentinput.endsWith(subtractSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += addSign;
                    } else if (!currentinput.endsWith(addSign)) {
                      currentinput += addSign;
                    }
                  } else if (label == subtractSign && !currentinput.startsWith('0')) {
                    if (currentinput.endsWith(divideSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += subtractSign;
                    } else if (currentinput.endsWith(multiplySign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += subtractSign;
                    } else if (currentinput.endsWith(divideSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += subtractSign;
                    } else if (currentinput.endsWith(addSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += subtractSign;
                    } else if (!currentinput.endsWith(subtractSign)) {
                      currentinput += subtractSign;
                    }
                  } else if (label == multiplySign && !currentinput.startsWith('0')) {
                    if (currentinput.endsWith(divideSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += multiplySign;
                    } else if (currentinput.endsWith(subtractSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += multiplySign;
                    } else if (currentinput.endsWith(divideSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += multiplySign;
                    } else if (currentinput.endsWith(addSign)) {
                      currentinput = currentinput.substring(0, currentinput.length - 1);
                      currentinput += multiplySign;
                    } else if (!currentinput.endsWith(multiplySign)) {
                      currentinput += multiplySign;
                    }
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.all(2),

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
                // decoration: BoxDecoration(color: Colors.blue),
                // width: 70,
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

                  // width: 70,
                  child: Icon(Icons.backspace_outlined)),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var numbers = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'zero'];
    List<Widget> itemList0 = [];
    List<Widget> itemList1 = [];
    List<Widget> itemList2 = [];
    List<Widget> itemList3 = [];
    List<Widget> itemList4 = [];
    List<Widget> itemList5 = [];
    //  List<Widget> itemList = [];

    itemList0.add(buildItem(number: -1, label: 'C'));
    itemList0.add(buildItem(number: -1, label: 'BACKSPACE'));

    for (int i = 0; i < 3; i++) {
      itemList1.add(buildItem(number: i + 1));
      // itemList.add(SizedBox(width: 15));
      itemList2.add(buildItem(number: i + 4));
      // itemList2.add(SizedBox(width: 15));
      itemList3.add(buildItem(number: i + 7));
      // itemList3.add(SizedBox(width: 15));
    }
    itemList4.add(buildItem(number: 0));
    itemList1.add(buildItem(number: -1, label: subtractSign));
    itemList2.add(buildItem(number: -1, label: multiplySign));
    itemList3.add(buildItem(number: -1, label: divideSign));
    itemList4.add(buildItem(number: -1, label: addSign));
    itemList5.add(buildItem(number: -1, label: equalSign));
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: itemList0,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: itemList3,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: itemList2,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: itemList1,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: itemList4,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: itemList5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
      // centerTitle: true,
      titleSpacing: 0.0,
      // backgroundColor: Colors.transparent,
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
