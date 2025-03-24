import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        // Adding the background image
        decoration: BoxDecoration(
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
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Semi-transparent box
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/user_icon.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cookie Crumble', // Replace with actual username
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .black, // Ensure text is visible on background
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Gender: F | Age: 20 | Height: \n5\'5\" | Weight: 56kg | Activity\nLevel: Moderate',
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
            SizedBox(height: 24),
            // Health-related clickable boxes
            _buildClickableBox(context, 'Health Conditions: PCOD/PCOS'),
            SizedBox(height: 8),
            _buildClickableBox(context, 'Allergies: Egg, Gluten'),
            SizedBox(height: 8),
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
        padding: EdgeInsets.all(16),
        width: double.infinity, // Set to max width
        decoration: BoxDecoration(
          color: Colors.grey[200]!.withOpacity(0.8), // Added opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
        padding: EdgeInsets.all(16),
        width: double.infinity, // Set to max width
        decoration: BoxDecoration(
          color: Colors.grey[200]!.withOpacity(0.8), // Added opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Family',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            _buildFamilyMemberBox('Mother', 'Thyroid Imbalance', 'None'),
            SizedBox(height: 8),
            _buildFamilyMemberBox('Father', 'None', 'Dust'),
            SizedBox(height: 8),
            _buildFamilyMemberBox('Brother', 'Lactose Intolerance', 'Milk'),
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
        padding: EdgeInsets.all(12),
        width: double.infinity, // Set to max width
        decoration: BoxDecoration(
          color: Colors.grey[300]!.withOpacity(0.8), // Added opacity
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 4),
            Text('Health Conditions: $healthConditions',
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 4),
            Text('Allergies: $allergies', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
