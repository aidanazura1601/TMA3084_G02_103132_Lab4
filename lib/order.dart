/// One line of a customer's order.
class OrderItem {
  const OrderItem({
    required this.name,
    required this.quantity,
    required this.unitPrice,
  });

  final String name;
  final int quantity;
  final double unitPrice;

  double get lineTotal => quantity * unitPrice;
}

/// The sample order shown on the Order Summary Screen.
const List<OrderItem> sampleOrder = [
  OrderItem(name: 'Vegetable Pizza', quantity: 1, unitPrice: 12.00),
  OrderItem(name: 'Cheese Pizza', quantity: 1, unitPrice: 10.00),
  OrderItem(name: 'Box of Fries', quantity: 1, unitPrice: 3.00),
];

/// Adds up every line of the order, in RM.
double orderTotal(List<OrderItem> items) {
  return items.fold<double>(0, (sum, item) => sum + item.lineTotal);
}
