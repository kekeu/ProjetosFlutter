import 'package:mobx_modular/app/modules/home1/home1_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_modular/app/modules/home1/home1_page.dart';

class Home1Module extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Home1Controller()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Home1Page()),
      ];

  static Inject get to => Inject<Home1Module>.of();
}
