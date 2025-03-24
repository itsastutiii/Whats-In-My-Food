import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  final Map<String, Map<String, dynamic>> _cartItems = {
    'Lays': {
      'calories': 150,
      'price': 30,
      'quantity': 2,
      'image': 'assets/Lays.png',
    },
    'Grain Free Tortilla': {
      'calories': 200,
      'price': 80,
      'quantity': 3,
      'image': 'assets/Grain Free Tortilla.png',
    },
    'Cabo Chips': {
      'calories': 180,
      'price': 60,
      'quantity': 1,
      'image': 'assets/Cabo Chips.png',
    },
    'MTR Sambar': {
      'calories': 90,
      'price': 45,
      'quantity': 1,
      'image': 'assets/MTR Sambar.png',
    },
    'Pure Quinoa': {
      'calories': 220,
      'price': 100,
      'quantity': 2,
      'image': 'assets/Pure Quinoa.png',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: const TextTheme(
          headline6: TextStyle(color: Colors.black),
        ).bodyText2,
        titleTextStyle: const TextTheme(
          headline6: TextStyle(color: Colors.black),
        ).headline6,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/bg2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _cartItems.keys.length,
                    itemBuilder: (context, index) {
                      String productName = _cartItems.keys.elementAt(index);
                      Map<String, dynamic> product = _cartItems[productName]!;
                      return _buildCartItem(productName, product);
                    },
                  ),
                ),
                const Divider(height: 2, color: Colors.grey),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showCheckoutConfirmation(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Proceed to Checkout",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(String productName, Map<String, dynamic> product) {
    int quantity = product['quantity'];
    int price = product['price'];
    int calories = product['calories'];
    String imagePath = product['image'];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              color: Colors.grey[200],
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Calories: $calories kcal",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    "Price: ₹${price * quantity}",
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Text(
              "Qty: $quantity",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void _showCheckoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Order"),
          content: const Text("Are you sure you want to place this order?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add order confirmation logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Order confirmed!"),
                  ),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
