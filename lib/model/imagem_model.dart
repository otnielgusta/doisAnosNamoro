import 'dart:convert';

class Imagem {
  int id;
  String endereco;
  int idpessoa;
  Imagem({
    required this.id,
    required this.endereco,
    required this.idpessoa,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'endereco': endereco,
      'idpessoa': idpessoa,
    };
  }

  factory Imagem.fromMap(Map<String, dynamic> map) {
    return Imagem(
      id: map['id'],
      endereco: map['endereco'],
      idpessoa: map['idpessoa'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Imagem.fromJson(String source) => Imagem.fromMap(json.decode(source));
}
