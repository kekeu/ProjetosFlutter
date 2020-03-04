import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home1_controller.g.dart';

class Home1Controller = _Home1ControllerBase with _$Home1Controller;

abstract class _Home1ControllerBase with Store {

  navigateToUser() {
    Modular.to.pushNamed("/user/");
  }

}
