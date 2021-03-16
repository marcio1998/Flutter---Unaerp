import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Texto'),
            actions: [Icon(Icons.home)],
          ),
          body: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(
                        height: double.infinity,
                        color: Colors.purple[300],
                        child: Center(
                          child: Text('A',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        )),
                  ),
                  Expanded(
                    child: Container(
                        height: double.infinity,
                        color: Colors.purple[100],
                        child: Center(
                            child: Text(
                          'B',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ))),
                  )
                ],
              )),
              Expanded(
                  child: Container(
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        'C',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      )))),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.green[200],
                          height: double.infinity,
                          child: Center(
                              child: Text(
                            'D',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          )))),
                  Expanded(
                      child: Container(
                          color: Colors.green[400],
                          height: double.infinity,
                          child: Center(
                              child: Text('E',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold)))))
                ],
              )),
            ],
          )),
    );
  }
}
