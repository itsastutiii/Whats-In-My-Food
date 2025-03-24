import 'package:flutter/material.dart';

class UsedList extends StatefulWidget {
  final List<String> usedList;

  const UsedList({Key? key, required this.usedList}) : super(key: key);

  @override
  _UsedListState createState() => _UsedListState();
}

class _UsedListState extends State<UsedList> {
  Map<String, int> _usedItems = {}; // Keeps track of each item's quantity
  final Map<String, Map<String, dynamic>> _pesticideDetails = {
    'InsectKiller': {
      'score': 85,
      'image': 'assets/insectkiller.jpeg',
    },
    'Fungicide': {
      'score': 70,
      'image': 'assets/f.jpeg',
    },
    'Rose Plant Pesticide': {
      'score': 90,
      'image': 'assets/rose.jpeg',
    },
    'Almidi': {
      'score': 65,
      'image': 'assets/almid.jpeg',
    },
  };

  int _overallImpact = 0; // Overall impact score

  @override
  void initState() {
    super.initState();
    _initializeUsedItems();
  }

  void _initializeUsedItems() {
    for (var item in widget.usedList) {
      _usedItems[item] = (_usedItems[item] ?? 0) + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesticide Grading"),
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
                    itemCount: _usedItems.keys.length,
                    itemBuilder: (context, index) {
                      String productName = _usedItems.keys.elementAt(index);
                      int quantity = _usedItems[productName]!;
                      return _buildUsedItem(productName, quantity);
                    },
                  ),
                ),
                const Divider(height: 2, color: Colors.grey),
                const SizedBox(height: 16),
                _buildOverallImpactSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsedItem(String productName, int quantity) {
    Map<String, dynamic>? product = _pesticideDetails[productName];
    if (product == null) return Container();

    String imagePath = product['image'];
    int scorePerItem = product['score'];

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
                    "Impact Score: ${(scorePerItem * quantity)}",
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (_usedItems[productName]! > 1) {
                              _usedItems[productName] =
                                  _usedItems[productName]! - 1;
                            } else {
                              _usedItems.remove(productName);
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
                            _usedItems[productName] =
                                _usedItems[productName]! + 1;
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
                  _usedItems.remove(productName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverallImpactSection() {
    _overallImpact = 0;
    _usedItems.forEach((productName, quantity) {
      int scorePerItem = _pesticideDetails[productName]!['score'];
      _overallImpact += scorePerItem * quantity;
    });

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Overall Impact Score",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text("$_overallImpact"),
          ],
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _showImpactPopup(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            backgroundColor: Colors.green,
          ),
          child: const Text(
            "Show Impact Details",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _showImpactPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Impact Information"),
          content: Text(
            "The overall impact score for the selected pesticides is $_overallImpact. "
            "This value represents the cumulative effect of the pesticides based on predetermined scores.",
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
