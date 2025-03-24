import 'package:flutter/material.dart';

class FarmerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        // Adding the background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg2.png'), // Path to bg2.png
            fit: BoxFit.cover, // Makes the image cover the entire background
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section with circle icon and username
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Semi-transparent box
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/farmerdp.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Farmer Pickle', // Replace with actual username
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .black, // Ensure text is visible on background
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Gender: F | Age: 24 | Pesticide \nPreference: Organic',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold, // Made text bold
                          color: Colors
                              .black, // Ensure text is visible on background
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Health-related clickable boxes
            _buildClickableBox(context, 'Crops Grown: Maize, Sunflower'),
            const SizedBox(height: 8),
            _buildClickableBox(context, 'Pesticides Used: Nitradium TM'),
            const SizedBox(height: 8),
            _buildFamilyBox(context),
          ],
        ),
      ),
    );
  }

  // A method to build clickable boxes for Health Conditions and Allergies
  Widget _buildClickableBox(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        // Handle box click
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity, // Set to max width
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), // Added opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // A method to build the Family box with sub-boxes for family members' health conditions and allergies
  Widget _buildFamilyBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle family box click
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity, // Set to max width
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), // Added opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Crops',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            _buildFamilyMemberBox('Crop 1', 'Crop Name 1', 'Pesticide Name 1'),
            const SizedBox(height: 8),
            _buildFamilyMemberBox('Crop 2', 'Crop Name 2', 'Pesticide Name 2'),
            const SizedBox(height: 8),
            _buildFamilyMemberBox('Crop 3', 'Crop Name 3', 'Pesticide Name 3'),
          ],
        ),
      ),
    );
  }

  // A method to build the sub-box for each family member
  Widget _buildFamilyMemberBox(
      String name, String healthConditions, String allergies) {
    return GestureDetector(
      onTap: () {
        // Handle family member click
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity, // Set to max width
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.5), // Added opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text('Crops Grown: $healthConditions',
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text('Pesticide: $allergies', style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
