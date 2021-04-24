import 'dart:math';

import 'package:flutter/material.dart';
import 'package:taller1s2/page/resultados.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String operaciones = "";
  String resultadoOperaciones = "";
  List<Text> listaResultados = [];

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: listaResultados,
                    ),
                  ],
                ),
              )),
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
                    operaciones += "√";
                  });
                },
                child: Text("√")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "²";
                  });
                },
                child: Text("x²")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += "%";
                  });
                },
                child: Text("%")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones =
                        operaciones.split("Expresión malformada").first;
                    operaciones = operaciones.isNotEmpty
                        ? operaciones.substring(0, operaciones.length - 1)
                        : "";
                  });
                },
                child: Text("<"))
          ]),
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
                    listaResultados = [];
                  });
                },
                child: Text("C")),
            ElevatedButton(
                onPressed: () {
                  getOperacion(operaciones);
                },
                child: Text("=")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    operaciones += " + ";
                  });
                },
                child: Text("+"))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultadosPage(
                              listadoResultados: listaResultados)));
                },
                child: Text("Mostrar resultados de operaciones")),
          ])
        ])),
      ],
    );
  }

  getOperacion(String operacion) {
    try {
      num resultado;

      if (!operacion.contains(" ")) {
        if (operacion.contains(new RegExp(r'²|√|%'))) {
          resultado = validarOperacionesEspeciales(operacion);
          setState(() {
            listaResultados.add(Text("$operacion = $resultado"));
            operacion = "$resultado";
            operaciones = operacion;
          });
        } else {
          setState(() {
            listaResultados.add(Text("$operacion = $operacion"));
            operaciones = operacion;
            resultadoOperaciones = operacion;
          });
        }
      } else {
        var array = operacion.split(" ");
        String operador = array[1].trim();
        num x = validarOperacionesEspeciales(array[0].trim());
        num y = validarOperacionesEspeciales(array[2].trim());

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
          listaResultados.add(Text("$operacion = $resultado"));
          operaciones = "$resultado";
        });

        if (array.length > 3) {
          array = array.sublist(3);
          array.insert(0, resultado.toString());
          operacion = array.join(" ");
          getOperacion(operacion);
        }
      }
    } catch (e) {
      setState(() {
        operaciones += "\nExpresión malformada";
      });
    }
  }

  num validarOperacionesEspeciales(String numeroCuadratico) {
    num resultado;
    if ("²".allMatches(numeroCuadratico).length == 1) {
      var numero = double.parse(numeroCuadratico.split("²").first);
      resultado = numero * numero;
      resultado = resultado % 1 == 0 ? resultado.round() : resultado;
      return resultado;
    }

    if ("√".allMatches(numeroCuadratico).length == 1) {
      var numero = double.parse(numeroCuadratico.split("√").first);
      resultado = sqrt(numero);
      resultado = resultado % 1 == 0 ? resultado.round() : resultado;
      return resultado;
    }

    if ("%".allMatches(numeroCuadratico).length == 1) {
      var numero = double.parse(numeroCuadratico.split("%").first);
      resultado = numero / 100;
      resultado = resultado % 1 == 0 ? resultado.round() : resultado;
      return resultado;
    }
    return double.parse(numeroCuadratico);
  }
}
