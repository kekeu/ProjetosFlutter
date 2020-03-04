import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobx_modular/app/modules/home1/home1_controller.dart';
import 'package:mobx_modular/app/modules/home1/home1_module.dart';

void main() {
  initModule(Home1Module());
  Home1Controller home1;

  setUp(() {
    home1 = Home1Module.to.get<Home1Controller>();
  });

  group('Home1Controller Test', () {
    test("First Test", () {
      expect(home1, isInstanceOf<Home1Controller>());
    });

    test("Set Value", () {
      /*expect(home1.value, equals(0));
      home1.increment();
      expect(home1.value, equals(1));*/
    });
  });
}
