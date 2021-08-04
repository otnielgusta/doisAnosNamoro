import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:otnielgraciela/database/db.dart';
import 'package:otnielgraciela/pages/home_page/home_controller.dart';
import 'package:otnielgraciela/pages/home_page/home_page_repository.dart';
import 'package:otnielgraciela/pages/home_page/imagem_state.dart';
import 'package:otnielgraciela/pages/home_page/widgets/image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();
  @override
  void initState() {
    controller.imageNotifier.addListener(() {
      setState(() {});
    });
    carregaImagens();
    super.initState();
  }

  void carregaImagens() async {
    await controller.getImagens();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.imageNotifier.value == ImagemState.loading)
                  Center(child: CircularProgressIndicator())
                else if (controller.imageNotifier.value == ImagemState.success)
                  ...controller.imagens.map((e) {
                    return AnimatedCard(
                      direction: AnimatedCardDirection.top,
                      child: ImageWidget(
                        imagem: e,
                        controller: controller,
                      ),
                    );
                  }).toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*

*/