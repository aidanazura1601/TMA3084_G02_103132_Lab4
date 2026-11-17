import 'package:flutter/material.dart';

import 'order.dart';

/// Shows every line of an order and the total from [orderTotal].
class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({super.key, this.items = sampleOrder});

  final List<OrderItem> items;

  @override
  Widget build(BuildContext context) {
    final total = orderTotal(items);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Summary'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final item in items)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.local_pizza),
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text('RM ${item.lineTotal.toStringAsFixed(2)}'),
                ),
              ),
            const Divider(height: 32),
            Text(
              'Total: RM ${total.toStringAsFixed(2)}',
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
