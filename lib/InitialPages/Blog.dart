import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/InitialPages/MyHomePage.dart';

class BlogPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Customize as needed
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(username: 'Cookie')),
            ); // Redirect to the homepage route
          },
        ),
        title: Text("Blog Posts"),
      ),
      body: Stack(
        children: [
          // Background image with opacity
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaX: 0.0, sigmaY: 0.0), // Optional: Add blur to the image
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(
                      0.3), // Apply 70% opacity to the background image
                  BlendMode.dstIn,
                ),
                child: Image.asset(
                  'assets/bg2.png', // Set background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Blog content
          Padding(
            padding: EdgeInsets.only(
                top:
                    kToolbarHeight), // Prevent the content from being hidden under the AppBar
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0), // General padding for the content
              child: Column(
                children: [
                  BlogPostCard(
                    imageUrl: 'assets/blog1.jpeg',
                    title: 'Fruits and Sugars - When Sugar is Good',
                    author: 'Nikita Sharma',
                    onTap: () {
                      // Navigate to the blog post details or do something when clicked
                      print('Blog 1 clicked');
                    },
                  ),

                  BlogPostCard(
                    imageUrl: 'assets/blog2.jpeg',
                    title: 'Halloween and Candy Labels Decoded',
                    author: 'Jia Seed',
                    onTap: () {
                      // Navigate to the blog post details or do something when clicked
                      print('Blog 2 clicked');
                    },
                  ),
                  BlogPostCard(
                    imageUrl: 'assets/blog4.png',
                    title: 'Baking, Air Frying - Crunch with Wellness',
                    author: 'Johnny Cash',
                    onTap: () {
                      // Navigate to the blog post details or do something when clicked
                      print('Blog 3 clicked');
                    },
                  ),
                  // Add more BlogPostCards here as needed
                  BlogPostCard(
                    imageUrl: 'assets/blog5.png',
                    title: 'The Pesticides Tradeoff',
                    author: 'Pritilata Wadedar',
                    onTap: () {
                      // Navigate to the blog post details or do something when clicked
                      print('Blog 4 clicked');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlogPostCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final VoidCallback onTap;

  BlogPostCard({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Make the entire card clickable
      child: Container(
        width: double.infinity, // Ensure container takes up the full width
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, width: 2.0), // Black border for the card
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white, // White background for the entire container
        ),
        margin: EdgeInsets.only(bottom: 16.0), // Margin between blog posts
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align left
                children: [
                  // Title with white background
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  // Author with white background
                  Text(
                    'By $author',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
