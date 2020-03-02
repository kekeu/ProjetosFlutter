import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_modular/app/shared/utils/constants.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController animationController;

  Widget logo;

  @override
  void initState() {
    super.initState();
    controller.startTime();

    animationController = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 100, end: 60).animate(animationController)
      ..addStatusListener(_buildComponenterRender)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
  }

  _buildComponenterRender(listener) async {
    var usuario = 'Bem vindo!';
    if (controller.isLogged())
      usuario = controller.getUsername().split(' ').first;
    if (AnimationStatus.completed == listener) {
      setState(() {
        logo = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              child: Image.asset(
                'assets/images/sesc_logo.png',
                excludeFromSemantics: true,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              usuario,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      focused: true,
      label: 'Abrindo aplicativo. Aguarde!',
      child: Scaffold(
        primary: true,
        backgroundColor: Colors.white,
        body: Container(
            decoration: MyBoxDecoration(),
          child: Center(
            child: Container(
              child: logo ??
                  Container(
                    height: animation?.value,
                    width: animation?.value,
                    child: Image.asset(
                      'assets/images/sesc_logo.png',
                      excludeFromSemantics: true,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
