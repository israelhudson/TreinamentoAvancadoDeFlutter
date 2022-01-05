import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_test_aula/controller/home_controller.dart';
import 'package:flutter_widget_test_aula/view/home_page.dart';

void main() {
  HomeController controller;

  setUp(() {
    controller = HomeController();
  });

  group('Test widgets', () {
    testWidgets('Check FAB exists', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text('Home Page'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byTooltip('Increment'), findsOneWidget);
      expect(find.byKey(Key('segunda')), findsNWidgets(1));
    });

    testWidgets('Check Image widget erros', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.byType(Image), findsOneWidget);
    });
  });
}
