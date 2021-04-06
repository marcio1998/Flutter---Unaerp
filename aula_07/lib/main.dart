import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',
      initialRoute: '/primeira',
      routes: {
        '/primeira': (context) => PrimeiraTela(),
        '/segunda': (context) => SegundaTela(),
        '/terceira': (context) => TerceiraTela(),
        '/quarta': (context) => QuartaTela()
      },
    ),
  );
}

//MODELO DE DADOS
//Este Modelo de dados será utilizado para troca de dados entre as telas do APp.
class Mensagem {
  final String titulo;
  final String conteudo;
  Mensagem(this.titulo, this.conteudo);
}

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  var _txtTile = TextEditingController();
  var _txtConteudo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Tela'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OutlineButton(
                child: Text('Proximo'),
                onPressed: () {
                  //Navegar para segunda tela.
                  Navigator.pushNamed(context, '/segunda');
                },
              ),
              SizedBox(height: 40),
              TextField(
                controller: this._txtTile,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: this._txtConteudo,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              OutlineButton(
                child: Text('Enviar'),
                onPressed: () {
                  var msg =
                      Mensagem(this._txtTile.text, this._txtConteudo.text);
                  Navigator.pushNamed(context, '/segunda', arguments: msg);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// SEGUNDA TELA
//
class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Receber o objeto da classe mensagem.
    Mensagem msg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Tela'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: Text('Anterior'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              OutlinedButton(
                child: Text('Próximo'),
                onPressed: () {
                  Navigator.pushNamed(context, '/terceira');
                },
              ),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Titulo: ',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Text(msg.titulo),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Conteúdo: ',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  Text(msg.conteudo),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class TerceiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terceira Tela'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: Text('Anterior'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              OutlinedButton(
                child: Text('Próximo'),
                onPressed: () {
                  Navigator.pushNamed(context, '/quarta');
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class QuartaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quarta Tela'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                child: Text('Anterior'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
