// Modelo de dados que seá utilizado para encapsular os dados recuperados do cloudfire store.
class Cafe {
  //Atributos.
  String id;
  String nome;
  String preco;

  //Construtor
  Cafe(this.id, this.nome, this.preco);

  //Converter um documento em um objeto.

  Cafe.forMap(Map<String, dynamic> map, String id) {
    this.id = id ?? '';
    this.nome = map['nome'];
    this.preco = map['preco'];
  }

  //Coverter um objeto em documento.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this.id;
    map['nome'] = this.nome;
    map['preco'] = this.preco;
    return map;
  }
}
