import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_modular/app/shared/auth/auth_controller.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  final AuthController _authController = Modular.get();

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    await Future.delayed(const Duration(seconds: 2));
    if (isLogged())
      Modular.to.pushReplacementNamed("/home/");
    else
      Modular.to.pushReplacementNamed("/login/");
  }

  bool isLogged() {
    return _authController.isLogged();
  }

  String getUsername() {
    return _authController.user.displayName;
  }

}
