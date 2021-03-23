import 'package:flutter/material.dart';
import './CarroWidget.dart';

void main() => runApp(Aula04());

class Aula04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "CarApp",
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              CarroWidget('Audi', 'Q8', 'lib/image/audi_q8.jpg'),
              CarroWidget('Audi', 'Q8', 'lib/image/audi_q8.jpg'),
              CarroWidget('Audi', 'Q8', 'lib/image/audi_q8.jpg'),
              CarroWidget('Audi', 'Q8', 'lib/image/audi_q8.jpg'),
              CarroWidget('Audi', 'Q8', 'lib/image/audi_q8.jpg')
            ],
          ))),
    );
  }
}
