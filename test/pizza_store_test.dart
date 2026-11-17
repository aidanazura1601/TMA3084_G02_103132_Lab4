import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('Menu lists the three items', (tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    expect(find.text('Pizza Store'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('Tapping a card opens its detail screen', (tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.tap(find.text('Vegetable Pizza'));
    await tester.pumpAndSettle();

    expect(find.text(vegetablePizza.description), findsOneWidget);
  });

  testWidgets('Back button returns to the menu', (tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.tap(find.text('Box of Fries'));
    await tester.pumpAndSettle();
    expect(find.text(boxOfFries.description), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text(boxOfFries.description), findsNothing);
    expect(find.text('Cheese Pizza'), findsOneWidget);
  });
}
