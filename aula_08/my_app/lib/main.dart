import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/cafe.dart';

void main() async {
  //Registrar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/principal',
    routes: {
      '/principal': (context) => TelaPrincipal(),
    },
  ));

  //Teste do Firebase

  // //adicionar um novo documento
  // db
  //     .collection('cafes')
  //     .add({'nome': 'Café Melita de 500g', 'preco': 'R\$ 9,85'});

//   Cafe cafe = Cafe('', 'Café utam 1kg', 'R\$25,65');
//   db.collection('cafes').add(cafe.toJson());
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  var db = FirebaseFirestore.instance;
  List<Cafe> cafes = [];
  //Declaração de um ouvidor.
  //Alterações realizadas na coleção.
  StreamSubscription<QuerySnapshot> query;

  @override
  void initState() {
    super.initState();
    //Registrar o 'ouvidor'
    query?.cancel();

    query = db.collection('cafes').snapshots().listen((event) {
      setState(() {
        cafes = event.docs.map((e) => Cafe.forMap(e.data(), e.id)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: Center(
          child: Text(
            'Café Store',
          ),
        ),
      ),
      //Exibir os documentos.
      body: StreamBuilder<QuerySnapshot>(
          //definir a fonte de dados.
          stream: db.collection('cafes').snapshots(),
          //Aparencia.
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Erro ao conectar'),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return ListView.builder(
                    itemCount: cafes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          cafes[index].nome,
                          style: TextStyle(fontSize: 24),
                        ),
                        subtitle: Text(
                          cafes[index].preco,
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            db
                                .collection('cafes')
                                .doc(cafes[index].id)
                                .delete();
                          },
                        ),
                      );
                    });
            }
          }),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
