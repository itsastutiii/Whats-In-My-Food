import 'package:flutter/material.dart';
import 'package:flutter_application_1/InitialPages/Farmer-UI/FarmerHome.dart';
import 'package:flutter_application_1/InitialPages/Farmer-UI/FarmerShop.dart';
import 'package:flutter_application_1/InitialPages/Farmer-UI/UsedList.dart';
import 'FarmerProfile.dart';
import 'package:flutter_application_1/InitialPages/Premium.dart';

class FarmerSearch extends StatefulWidget {
  final String username;

  const FarmerSearch({super.key, required this.username});

  @override
  _FarmerSearchState createState() => _FarmerSearchState();
}

class _FarmerSearchState extends State<FarmerSearch> {
  String selectedCategory = 'Organic'; // Default selected category
  List<String> usedList = []; // List to hold products for "Eat List"
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
              backgroundImage: AssetImage("assets/farmerdp.png"),
              radius: 16,
            ),
            const SizedBox(width: 8),
            Text(
              'Hi, ${widget.username}',
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
                MaterialPageRoute(builder: (context) => FarmerProfile()),
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
                        FarmerHome(username: widget.username)),
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
                                  builder: (context) => FarmerShop()),
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
                                      UsedList(usedList: usedList)),
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
                          child: const Text('Used List'),
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
                        _buildCategoryBox('Organic'),
                        _buildCategoryBox('Carbamate'),
                        _buildCategoryBox('AntiMicrobial'),
                        _buildCategoryBox('Pheramones'),
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
    if (selectedCategory == 'Organic') {
      productWidgets = [
        _buildProductBox('InsectKiller', 'assets/insectkiller.jpeg'),
        _buildProductBox('Fungicide', 'assets/f.jpeg'),
        _buildProductBox('Rose Plant Pesticide', 'assets/rose.jpeg'),
        _buildProductBox('Almidi', 'assets/almid.jpeg'),
      ];
    } else if (selectedCategory == 'Carbamate') {
      productWidgets = [
        _buildProductBox('InsectKiller', 'assets/insectkiller.jpeg'),
        _buildProductBox('Fungicide', 'assets/f.jpeg'),
        _buildProductBox('Rose Plant Pesticide', 'assets/rose.jpeg'),
        _buildProductBox('Almidi', 'assets/almid.jpeg'),
      ];
    } else if (selectedCategory == 'AntiMicrobial') {
      productWidgets = [
        _buildProductBox('InsectKiller', 'assets/insectkiller.jpeg'),
        _buildProductBox('Fungicide', 'assets/f.jpeg'),
        _buildProductBox('Rose Plant Pesticide', 'assets/rose.jpeg'),
        _buildProductBox('Almidi', 'assets/almid.jpeg'),
      ];
    } else if (selectedCategory == 'Pheramones') {
      productWidgets = [
        _buildProductBox('InsectKiller', 'assets/insectkiller.jpeg'),
        _buildProductBox('Fungicide', 'assets/f.jpeg'),
        _buildProductBox('Rose Plant Pesticide', 'assets/rose.jpeg'),
        _buildProductBox('Almidi', 'assets/almid.jpeg'),
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
                  icon: const Icon(Icons.emoji_nature),
                  onPressed: () {
                    setState(() {
                      usedList.add(productName);
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
