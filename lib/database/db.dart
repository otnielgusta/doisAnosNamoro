import 'dart:convert';

import 'package:otnielgraciela/model/imagem_model.dart';
import 'package:otnielgraciela/model/pessoa_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static final DB instance = DB._init();

  static Database? _database;

  DB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('./surpresa.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase('./assets/db/surpresa.db', version: 1);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<Imagem>> getImages() async {
    List<Imagem> lista = [];
    final db = await instance.database;
    if (db.isOpen) {
      final response = await db.rawQuery('select * from imagem;');
      response.forEach((e) {
        Imagem img = Imagem(
            id: e['id'] as int,
            endereco: e['endereco'] as String,
            idpessoa: e['idpessoa'] as int);

        lista.add(img);
      });
    }
    return lista;
  }

  Future<Pessoa> getPessoa({required int id}) async {
    final db = await instance.database;

    if (db.isOpen) {
      final response = await db.rawQuery("select * from pessoa where id = $id");
      Pessoa pessoa = Pessoa(
          id: response[0]['id'] as int,
          nome: response[0]['nome'] as String,
          foto: response[0]['foto'] as String,
          facebook: response[0]['facebook'] as String);
      return pessoa;
    } else {
      return Pessoa(id: null, nome: null, foto: null, facebook: null);
    }
  }
}
