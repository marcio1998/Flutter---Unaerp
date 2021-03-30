import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculadora IMC',
    home: TelaPrincipal(),

    //Tema
    theme: ThemeData(
      primaryColor: Colors.blue[900],
      backgroundColor: Colors.grey[100],
      fontFamily: 'Open Sans', //Raleway
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 24),
        headline3: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
      ),
    ),
  ));
}

//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Atributos para armazenar os valores digitados pelo usuário
  var _txtPeso = TextEditingController();
  var _txtAltura = TextEditingController();
  var _formId = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculadora de IMC",
            style: Theme.of(context).textTheme.headline1,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.delete_rounded),
              onPressed: () {
                //limpar mensagem de erro de validação.
                setState(() {
                  this._formId.currentState.reset();
                  this._txtPeso.clear();
                  this._txtAltura.clear();
                  FocusScope.of(context).unfocus();
                });
              },
            )
          ],
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            child: Form(
                key: this._formId,
                child: Container(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.people_alt,
                        size: 120,
                        color: Theme.of(context).primaryColor,
                      ),
                      campoTexto("Peso", this._txtPeso),
                      campoTexto("Altura", this._txtAltura),
                      botao("calcular"),
                    ],
                  ),
                ))));
  }

  //CAMPO DE TEXTO PARA ENTRADA DE DADOS.
  Widget campoTexto(rotulo, variavel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        //variável que receberá o valor contido no campo de texto
        controller: variavel,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline3,
          hintText: "Entre com Valor",
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        //validação.
        validator: (value) {
          if (double.tryParse(value) == null) {
            return "Entre com um valor numérico";
          } else {
            return null; //tudo certo com a conversão number.
          }
        },
      ),
    );
  }

  //Construir Botão.
  Widget botao(rotulo) {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child: ElevatedButton(
            child: Text(
              rotulo,
              style: Theme.of(context).textTheme.headline1,
            ),
            onPressed: () {
              //Validador do campo de texto.
              if (this._formId.currentState.validate()) {
                //o método setState é utilizado todas as vezes que é necessário altera o estado app.
                setState(() {
                  double peso = double.parse(this._txtPeso.text);
                  double altura = double.parse(this._txtAltura.text);
                  double imc = peso / pow(altura, 2);
                  CaixaDialogo("O Valor do IMC é ${imc.toStringAsFixed(2)}");
                });
              }
            }));
  }

  //Caixa de dialago.
  CaixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Resultado"),
              content: Text(msg),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Fechar'))
              ]);
        });
  }
}
