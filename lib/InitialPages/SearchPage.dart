import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Premium.dart';
import 'MyHomePage.dart';
import 'EatList.dart'; // Importing the EatList screen
import 'ShoppingCart.dart'; // Importing the ShoppingCart screen

class SearchPage extends StatefulWidget {
  final String username;

  const SearchPage({super.key, required this.username});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'Gluten Free'; // Default selected category
  List<String> eatList = []; // List to hold products for "Eat List"
  List<String> shoppingCart = []; // List to hold products for "Shopping Cart"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/user_icon.png"),
              radius: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'Hello, ${widget.username}',
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PremiumPlanPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(username: widget.username)),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/bg2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Bar with black outline and white fill
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Search for products',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 16), // Spacer between search bar and buttons

                  // Buttons leading to Shopping List and Eat List with opacity 1
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingCart()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: BorderSide(
                                color: Colors.black), // Black outline
                          ),
                          child: const Text('Shopping Cart'),
                        ),
                      ),
                      const SizedBox(width: 16), // Spacing between the buttons
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EatList(eatList: eatList)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: BorderSide(
                                color: Colors.black), // Black outline
                          ),
                          child: const Text('Eat List'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 16), // Spacer between buttons and other content
                  const Text(
                    "Top Picks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCategoryBox('Gluten Free'),
                        _buildCategoryBox('Vegan'),
                        _buildCategoryBox('Low Sugar'),
                        _buildCategoryBox('Organic'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Recommended Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: _buildProductGrid(),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProductGrid() {
    List<Widget> productWidgets = [];
    if (selectedCategory == 'Gluten Free') {
      productWidgets = [
        _buildProductBox('Lays', 'assets/Lays.png'),
        _buildProductBox(
            'Terra Veggie Crisps', 'assets/Terra Veggie Crisps.png'),
        _buildProductBox(
            'Grain Free Tortilla', 'assets/Grain Free Tortilla.png'),
        _buildProductBox('Cabo Chips', 'assets/Cabo Chips.png'),
      ];
    } else if (selectedCategory == 'Vegan') {
      productWidgets = [
        _buildProductBox('Sour Patch', 'assets/Sour Patch.png'),
        _buildProductBox('SWAD Veg Biryani', 'assets/SWAD Veg Biryani.png'),
        _buildProductBox('MTR Sambar', 'assets/MTR Sambar.png'),
        _buildProductBox('Doritos', 'assets/Doritos.png'),
      ];
    } else if (selectedCategory == 'Low Sugar') {
      productWidgets = [
        _buildProductBox('Organic Vegetable', 'assets/Organic Vegetable.png'),
        _buildProductBox('Pure Quinoa', 'assets/Pure Quinoa.png'),
        _buildProductBox('Foxtail Millet', 'assets/Foxtail Millet.png'),
        _buildProductBox(
            'Organic Chocolate Fruits', 'assets/Organic Chocolate Fruits.png'),
      ];
    } else if (selectedCategory == 'Organic') {
      productWidgets = [
        _buildProductBox('Muesli', 'assets/Muesli.png'),
        _buildProductBox('BakeHouse Grains', 'assets/BakeHouse Grains.png'),
        _buildProductBox('Pasta', 'assets/Pasta.png'),
        _buildProductBox(
            'Gluten Free Brownie', 'assets/Gluten Free Brownie.png'),
      ];
    }
    return productWidgets;
  }

  Widget _buildCategoryBox(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xB3FFFFFF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildProductBox(String productName, String imagePath) {
    return Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xB3FFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(imagePath),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              productName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                // Icon for adding to Eat List
                IconButton(
                  icon: const Icon(Icons.fastfood),
                  onPressed: () {
                    setState(() {
                      eatList.add(productName);
                    });
                    print('$productName added to Eat List');
                  },
                ),
                // Icon for adding to Shopping Cart
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    setState(() {
                      shoppingCart.add(productName);
                    });
                    print('$productName added to Shopping Cart');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
