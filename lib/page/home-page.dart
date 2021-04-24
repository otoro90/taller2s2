import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
          height: 100,
        ),
        Container(
            color: Colors.yellow,
            child: Column(children: [
              Row(children: [
                ElevatedButton(onPressed: () {}, child: Text("0")),
                ElevatedButton(onPressed: () {}, child: Text("C")),
                ElevatedButton(onPressed: () {}, child: Text("=")),
                ElevatedButton(onPressed: () {}, child: Text("+"))
              ])
            ])),
      ],
    );
  }
}
