import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String operaciones = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Container(
          color: Colors.blue,
          height: 100,
          child: Row(
            children: [
              Text(operaciones),
            ],
          ),
        ),
        Container(
            color: Colors.yellow,
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "7";
                      });
                    },
                    child: Text("7")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "8";
                      });
                    },
                    child: Text("8")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "9";
                      });
                    },
                    child: Text("9")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += " / ";
                      });
                    },
                    child: Text("/"))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "4";
                      });
                    },
                    child: Text("4")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "5";
                      });
                    },
                    child: Text("5")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "6";
                      });
                    },
                    child: Text("6")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += " x ";
                      });
                    },
                    child: Text("x"))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "1";
                      });
                    },
                    child: Text("1")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "2";
                      });
                    },
                    child: Text("2")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "3";
                      });
                    },
                    child: Text("3")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += " - ";
                      });
                    },
                    child: Text("-"))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += "0";
                      });
                    },
                    child: Text("0")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones = "";
                      });
                    },
                    child: Text("C")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        getOperacion();
                      });
                    },
                    child: Text("=")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operaciones += " + ";
                      });
                    },
                    child: Text("+"))
              ])
            ])),
      ],
    );
  }

  getOperacion() {
    var array = operaciones.split(" ");
    if (array[1] == "+") {
      operaciones =
          (double.parse(array[0]) + double.parse(array[2])).toString();
    } else if (array[1] == "-") {
      operaciones =
          (double.parse(array[0]) - double.parse(array[2])).toString();
    } else if (array[1] == "x") {
      operaciones =
          (double.parse(array[0]) * double.parse(array[2])).toString();
    } else if (array[1] == "/") {
      operaciones =
          (double.parse(array[0]) / double.parse(array[2])).toString();
    }
  }
}
