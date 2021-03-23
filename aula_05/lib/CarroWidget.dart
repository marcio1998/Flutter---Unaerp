import 'package:flutter/material.dart';

class CarroWidget extends StatelessWidget {
  final String marca;
  final String modelo;
  final String foto;

  CarroWidget(this.marca, this.modelo, this.foto);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.purple[100],
            border: Border.all(width: 2, color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Text(this.marca),
            Text(this.modelo),
            Container(
                padding: EdgeInsets.all(5),
                height: 160,
                width: double.infinity,
                child: Image.asset(foto, fit: BoxFit.cover))
          ],
        ));
  }
}
