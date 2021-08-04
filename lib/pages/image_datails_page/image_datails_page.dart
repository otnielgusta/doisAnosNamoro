import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:otnielgraciela/model/imagem_model.dart';
import 'package:otnielgraciela/pages/home_page/home_controller.dart';
import 'package:otnielgraciela/pages/pessoa_state.dart';

class ImageDetails extends StatefulWidget {
  const ImageDetails({Key? key, required this.imagem, required this.controller})
      : super(key: key);

  final HomeController controller;
  final Imagem imagem;

  @override
  _ImageDetailsState createState() => _ImageDetailsState();
}

class _ImageDetailsState extends State<ImageDetails> {
  @override
  void initState() {
    widget.controller.pessoaNotifier.addListener(() {
      setState(() {});
    });
    widget.controller.getPessoas(id: widget.imagem.idpessoa);
    super.initState();
  }

  ImageProvider foto() {
    try {
      return NetworkImage(
        widget.controller.pessoa.foto!,
      );
    } catch (e) {
      return NetworkImage(
        "https://img.icons8.com/ios-glyphs/452/user--v1.png",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                BackButton(
                  color: Colors.grey.shade800,
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: widget.controller.pessoaNotifier.value == PessoaState.loading
              ? CircularProgressIndicator()
              : widget.controller.pessoaNotifier.value == PessoaState.success
                  ? Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: widget.imagem.endereco,
                            child: AnimatedCard(
                              direction: AnimatedCardDirection.left,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    )
                                  ]),
                                  child: Image.asset(
                                      'assets/imagens/${widget.imagem.endereco}'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedCard(
                          direction: AnimatedCardDirection.bottom,
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(blurRadius: 5)],
                              color: Colors.grey.shade800,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF933F95),
                                          Color(0xFFFB2032),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(backgroundImage: foto()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    widget.controller.pessoa.nome!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : widget.controller.pessoaNotifier.value == PessoaState.error
                      ? Container()
                      : Container()),
    );
  }
}


/*

ValueListenableBuilder<PessoaState>(
                valueListenable: widget.controller.pessoaNotifier.value,
                builder: (_, state, __) {
                  if (state == PessoaState.loading) {
                    return CircularProgressIndicator();
                  } else if (state == PessoaState.success) {
                    return Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: widget.imagem.endereco,
                            child: Image.asset(
                                'assets/imagens/${widget.imagem.endereco}'),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                      widget.controller.pessoa.foto!,
                                    )),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              Text(
                                widget.controller.pessoa.nome!,
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (state == PessoaState.error) {
                    return Container(
                      child: Text("Houve um erro"),
                    );
                  } else {
                    return Container();
                  }
                })

                */