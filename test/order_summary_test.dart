import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/order.dart';
import 'package:lab_04/order_summary.dart';

void main() {
  test('orderTotal adds up the sample order to RM 25.00', () {
    expect(orderTotal(sampleOrder), 25.00);
  });

  testWidgets('Order summary shows the items and total RM 25.00', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: OrderSummaryScreen()));

    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('Vegetable Pizza'), findsOneWidget);
    expect(find.text('Cheese Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsNWidgets(3));
    expect(find.text('Total: RM 25.00'), findsOneWidget);
  });

  testWidgets('Back button closes the order summary', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrderSummaryScreen(),
              ),
            ),
            child: const Text('Open summary'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open summary'));
    await tester.pumpAndSettle();
    expect(find.text('Total: RM 25.00'), findsOneWidget);

    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.text('Total: RM 25.00'), findsNothing);
    expect(find.text('Open summary'), findsOneWidget);
  });
}
