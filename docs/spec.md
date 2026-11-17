# Mini-Spec: Order Summary Screen

1. **Inputs:** a list of `OrderItem` (name, quantity, unit price); defaults to `sampleOrder` from `lib/order.dart`.
2. **Output:** a screen titled "Order Summary" listing each item's name, quantity and line price, then the total as "Total: RM 25.00".
3. **Rules:** the total must come from `orderTotal()` in `lib/order.dart`; prices show 2 decimal places with the "RM" prefix.
4. **Rules:** a Back button calls `Navigator.pop(context)` to return to the previous screen.
5. **Out of scope:** editing quantities, payment, saving orders, and changes to any other file.
6. **Check:** `test/order_summary_test.dart` passes, and `flutter analyze` returns "No issues found!".
