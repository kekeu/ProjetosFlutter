import 'package:mobx_modular/app/modules/login/login_module.dart';
import 'package:mobx_modular/app/modules/splash/splash_controller.dart';
import 'package:mobx_modular/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx_modular/app/app_widget.dart';
import 'package:mobx_modular/app/modules/home/home_module.dart';
import 'package:mobx_modular/app/modules/splash/splash_page.dart';
import 'package:mobx_modular/app/shared/auth/auth_controller.dart';
import 'package:mobx_modular/app/shared/auth/repositories/auth_repository.dart';
import 'package:mobx_modular/app/shared/auth/repositories/auth_repository_interface.dart';

import 'modules/home1/home1_module.dart';
import 'modules/user/user_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController()),
    Bind((i) => AppController()),
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind((i) => AuthController()),
  ];

  @override
  List<Router> get routers => [
    Router('/', child: (_, args) => SplashPage()),
    Router('/home', module: HomeModule()),
    Router('/home1', module: Home1Module()),
    Router('/user', module: UserModule()),
    Router('/login', module: LoginModule(),
        transition: TransitionType.noTransition),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
