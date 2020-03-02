import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_modular/app/shared/auth/repositories/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {

  final IAuthRepository _authRepository = Modular.get();

  @observable
  FirebaseUser user;

  @action
  setUser(FirebaseUser value) => user = value;

  @action
  bool isLogged() {
    return user != null;
  }

  // Primeiramente tenta pegar o usuario
  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  Future logOut() {
    return _authRepository.getLogout();
  }

}