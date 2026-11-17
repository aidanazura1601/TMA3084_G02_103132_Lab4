import 'package:flutter/material.dart';

void main() {
  runApp(const PizzaStoreApp());
}

/// One item on the menu.
class MenuItem {
  const MenuItem({
    required this.name,
    required this.image,
    required this.description,
    required this.routeName,
  });

  final String name;
  final String image;
  final String description;
  final String routeName;
}

const vegetablePizza = MenuItem(
  name: 'Vegetable Pizza',
  image: 'assets/images/VegetablePZ.png',
  description: 'Fresh mushrooms, peppers, onions and olives on a crispy base.',
  routeName: 'vegetable',
);

const cheesePizza = MenuItem(
  name: 'Cheese Pizza',
  image: 'assets/images/cheesePZ.png',
  description: 'Classic pizza topped with melted mozzarella and tomato sauce.',
  routeName: 'cheese',
);

const boxOfFries = MenuItem(
  name: 'Box of Fries',
  image: 'assets/images/Fries.png',
  description: 'Golden, crispy fries served hot with ketchup on the side.',
  routeName: 'fries',
);

const menuItems = [vegetablePizza, cheesePizza, boxOfFries];

class PizzaStoreApp extends StatelessWidget {
  const PizzaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Store',
      initialRoute: 'menu',
      routes: {
        'menu': (context) => const MenuScreen(),
        'vegetable': (context) => const DetailScreen(item: vegetablePizza),
        'cheese': (context) => const DetailScreen(item: cheesePizza),
        'fries': (context) => const DetailScreen(item: boxOfFries),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Store'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [for (final item in menuItems) MenuCard(item: item)],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.orange,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, item.routeName),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              FoodImage(path: item.image, size: 80),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            FoodImage(path: item.image, size: 220),
            const SizedBox(height: 20),
            Text(
              item.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              item.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows a food picture, or a pizza icon if the picture cannot load.
class FoodImage extends StatelessWidget {
  const FoodImage({super.key, required this.path, required this.size});

  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) =>
          Icon(Icons.local_pizza, size: size, color: Colors.white),
    );
  }
}
