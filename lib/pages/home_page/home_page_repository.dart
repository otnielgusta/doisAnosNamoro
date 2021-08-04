import 'package:flutter/cupertino.dart';
import 'package:otnielgraciela/database/db.dart';
import 'package:otnielgraciela/model/imagem_model.dart';
import 'package:otnielgraciela/model/pessoa_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeRepository extends ChangeNotifier {
  List<Pessoa> _pessoas = [];
  List<Imagem> _imagens = [];

  List<Imagem> get imagens => _imagens;

  getImagens() async {}
}
