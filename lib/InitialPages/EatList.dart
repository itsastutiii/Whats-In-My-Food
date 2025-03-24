import 'package:flutter/material.dart';

class EatList extends StatefulWidget {
  final List<String> eatList;

  const EatList({Key? key, required this.eatList}) : super(key: key);

  @override
  _EatListState createState() => _EatListState();
}

class _EatListState extends State<EatList> {
  Map<String, int> _eatItems = {}; // Keeps track of each item's quantity
  final Map<String, Map<String, dynamic>> _productDetails = {
    'Lays': {
      'calories': 150,
      'image': 'assets/Lays.png',
    },
    'Terra Veggie Crisps': {
      'calories': 140,
      'image': 'assets/Terra Veggie Crisps.png',
    },
    'Grain Free Tortilla': {
      'calories': 200,
      'image': 'assets/Grain Free Tortilla.png',
    },
    'Cabo Chips': {
      'calories': 180,
      'image': 'assets/Cabo Chips.png',
    },
    'Sour Patch': {
      'calories': 110,
      'image': 'assets/Sour Patch.png',
    },
    'SWAD Veg Biryani': {
      'calories': 300,
      'image': 'assets/SWAD Veg Biryani.png',
    },
    'MTR Sambar': {
      'calories': 90,
      'image': 'assets/MTR Sambar.png',
    },
    'Doritos': {
      'calories': 150,
      'image': 'assets/Doritos.png',
    },
    'Organic Vegetable': {
      'calories': 50,
      'image': 'assets/Organic Vegetable.png',
    },
    'Pure Quinoa': {
      'calories': 220,
      'image': 'assets/Pure Quinoa.png',
    },
    'Foxtail Millet': {
      'calories': 180,
      'image': 'assets/Foxtail Millet.png',
    },
    'Organic Chocolate Fruits': {
      'calories': 160,
      'image': 'assets/Organic Chocolate Fruits.png',
    },
    'Muesli': {
      'calories': 130,
      'image': 'assets/Muesli.png',
    },
    'BakeHouse Grains': {
      'calories': 100,
      'image': 'assets/BakeHouse Grains.png',
    },
    'Pasta': {
      'calories': 210,
      'image': 'assets/Pasta.png',
    },
    'Gluten Free Brownie': {
      'calories': 250,
      'image': 'assets/Gluten Free Brownie.png',
    },
  };

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double _tdee = 0.0; // Total Daily Energy Expenditure
  int _caloriesMet = 0; // Calories consumed from food list

  @override
  void initState() {
    super.initState();
    _initializeEatItems();
  }

  void _initializeEatItems() {
    for (var item in widget.eatList) {
      _eatItems[item] = (_eatItems[item] ?? 0) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eat List"),
        backgroundColor: Colors.white, // White background
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
          // Background image with transparency effect
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                "assets/bg2.png", // Background image
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
                    itemCount: _eatItems.keys.length,
                    itemBuilder: (context, index) {
                      String productName = _eatItems.keys.elementAt(index);
                      int quantity = _eatItems[productName]!;
                      return _buildEatItem(productName, quantity);
                    },
                  ),
                ),
                const Divider(height: 2, color: Colors.grey),
                _buildUserDetailsInput(),
                const SizedBox(height: 16),
                _buildTotalCaloriesSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEatItem(String productName, int quantity) {
    // Get product details
    Map<String, dynamic>? product = _productDetails[productName];
    if (product == null)
      return Container(); // In case product details are missing

    String imagePath = product['image'];
    int caloriesPerItem = product['calories'];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Product image
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
            // Product details and quantity controls
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
                    "Calories: ${(caloriesPerItem * quantity)}", // Total calories for item
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (_eatItems[productName]! > 1) {
                              _eatItems[productName] =
                                  _eatItems[productName]! - 1;
                            } else {
                              _eatItems.remove(productName);
                            }
                          });
                        },
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            _eatItems[productName] =
                                _eatItems[productName]! + 1;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  _eatItems.remove(productName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserDetailsInput() {
    return Column(
      children: [
        const Text(
          "Enter Your Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _ageController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Age",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _weightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Weight (kg)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _heightController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Height (cm)",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTotalCaloriesSection() {
    _caloriesMet = 0;
    _eatItems.forEach((productName, quantity) {
      // Get the calories per item dynamically
      int caloriesPerItem = _productDetails[productName]!['calories'];
      _caloriesMet += caloriesPerItem * quantity;
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total Calories Met",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("$_caloriesMet kcal"),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _calculateCaloriesNeeds();
            _showCaloriePopup(context); // Show the pop-up after calculation
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            backgroundColor: Colors.green,
          ),
          child: const Text(
            "Calculate and Show Calorie Info",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _calculateCaloriesNeeds() {
    final int age = int.tryParse(_ageController.text) ?? 0;
    final double weight = double.tryParse(_weightController.text) ?? 0.0;
    final double height = double.tryParse(_heightController.text) ?? 0.0;

    if (age > 0 && weight > 0 && height > 0) {
      final bmr = 10 * weight + 6.25 * height - 5 * age + 5; // Mifflin-St Jeor
      final tdee =
          bmr * 1.2; // Assuming sedentary activity level (TDEE multiplier)
      setState(() {
        _tdee = tdee;
      });
    } else {
      // Handle invalid inputs
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please enter valid details to calculate TDEE."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  // Pop-up dialog to show calorie info
  void _showCaloriePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Calorie Information"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("TDEE: ${_tdee.toStringAsFixed(0)} kcal"),
              Text("Calories Met: $_caloriesMet kcal"),
              Text(
                "Calories Deficit: ${(_caloriesMet - _tdee).toStringAsFixed(0)} kcal",
                style: TextStyle(
                  color:
                      (_caloriesMet - _tdee) >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
