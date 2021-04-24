import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String operaciones = "";
  String resultadoOperaciones = "";

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
            child: Row(
              children: [
                Text(
                  resultadoOperaciones,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
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
                    resultadoOperaciones = "";
                  });
                },
                child: Text("C")),
            ElevatedButton(
                onPressed: () {
                  getOperacion();
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
    try {
      var array = operaciones.split(" ");
      num resultado;
      String operador = array[1].trim();
      double x = double.parse(array[0].trim());
      double y = double.parse(array[2].trim());

      resultado = (operador == "+")
          ? (x + y)
          : (operador == "-")
              ? (x - y)
              : (operador == "x")
                  ? (x * y)
                  : (operador == "/")
                      ? (x / y)
                      : "Operación invalida";

      resultado = resultado % 1 == 0 ? resultado.round() : resultado;

      setState(() {
        resultadoOperaciones =
            "$resultadoOperaciones\n $x $operador $y = $resultado";
        operaciones = "$resultado";
      });
    } catch (e) {
      setState(() {
        operaciones += "\nExpresión malformada";
      });
    }
  }
}
