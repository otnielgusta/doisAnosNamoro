import 'package:flutter/material.dart';
import 'package:otnielgraciela/model/imagem_model.dart';
import 'package:otnielgraciela/pages/image_datails_page/image_datails_page.dart';

import '../home_controller.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imagem,
    required this.controller,
  }) : super(key: key);

  final Imagem imagem;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetails(
                      imagem: imagem,
                      controller: controller,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 100, left: 20, right: 20, top: 20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black,
            )
          ],
          color: Colors.white,
        ),
        child: Hero(
          tag: imagem.endereco,
          child: Image.asset('assets/imagens/${imagem.endereco}'),
        ),
      ),
    );
  }
}
