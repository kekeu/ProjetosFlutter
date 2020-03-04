import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:mobx_modular/app/modules/home1/home1_page.dart';

main() {
  testWidgets('Home1Page has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(Home1Page(title: 'Home1')));
    final titleFinder = find.text('Home1');
    expect(titleFinder, findsOneWidget);
  });
}
