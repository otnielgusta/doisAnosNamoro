import 'package:flutter/cupertino.dart';
import 'package:otnielgraciela/database/db.dart';
import 'package:otnielgraciela/model/imagem_model.dart';
import 'package:otnielgraciela/model/pessoa_model.dart';
import 'package:otnielgraciela/pages/home_page/imagem_state.dart';
import 'package:otnielgraciela/pages/pessoa_state.dart';

class HomeController {
  ValueNotifier imageNotifier = ValueNotifier<ImagemState>(ImagemState.empty);
  ValueNotifier pessoaNotifier = ValueNotifier<PessoaState>(PessoaState.empty);

  set imageState(ImagemState imageState) => imageNotifier.value = imageState;
  ImagemState get imageState => imageNotifier.value;

  set pessoaState(PessoaState pessoaState) =>
      pessoaNotifier.value = pessoaState;
  PessoaState get pessoaState => pessoaNotifier.value;

  List<Imagem> imagens = [];

  Pessoa pessoa = Pessoa(id: null, nome: null, foto: null, facebook: null);

  final db = DB.instance;

  getImagens() async {
    this.imageState = ImagemState.loading;
    this.imagens = await db.getImages();
    if (this.imagens.length > 0) {
      this.imageState = ImagemState.success;
    } else {
      this.imageState = ImagemState.error;
    }
  }

  getPessoas({required int id}) async {
    this.pessoaState = PessoaState.loading;
    this.pessoa = await db.getPessoa(id: id);
    if (this.pessoa.id != null) {
      this.pessoaState = PessoaState.success;
    } else {
      this.imageState = ImagemState.error;
    }
  }
}
