import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_modular/app/shared/auth/auth_controller.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final AuthController _authController = Modular.get();

  logOff() async {
    await _authController.logOut();
    Modular.to.pushReplacementNamed("/login/");
  }

  FirebaseUser getUser() {
    return _authController.user;
  }
}
