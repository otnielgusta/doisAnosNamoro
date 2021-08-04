import 'package:flutter/material.dart';
import 'package:otnielgraciela/pages/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    iniciar();
    super.initState();
  }

  Future iniciar() async {
    Future.delayed(Duration(seconds: 4)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Image.asset(
          'assets/imagens/gif.gif',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
