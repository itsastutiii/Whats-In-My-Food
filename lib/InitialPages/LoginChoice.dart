import 'package:flutter/material.dart';
import 'package:flutter_application_1/InitialPages/Farmer-UI/FarmerHome.dart';
import 'package:flutter_application_1/InitialPages/LoginScreen.dart';
import 'package:flutter_application_1/InitialPages/SignUpScreen.dart';

class LoginChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Type'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //lead back to signup
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
                //lead to option to choose between farmer or consumer
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image with opacity
          Opacity(
            opacity: 0.7,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Centered buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250, // Fixed width for uniform size
                  height: 60, // Fixed height for uniform size
                  margin: const EdgeInsets.only(
                      bottom: 30), // Space between buttons
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor:
                          Colors.white.withOpacity(0.9), // Semi-transparent
                      side: const BorderSide(
                          color: Colors.black, width: 2), // Black outline
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                          //lead to option to choose between farmer or consumer
                        ),
                      );
                    },
                    child: const Text(
                      'Consumer Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250, // Fixed width for uniform size
                  height: 60, // Fixed height for uniform size
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor:
                          Colors.white.withOpacity(0.9), // Semi-transparent
                      side: const BorderSide(
                          color: Colors.black, width: 2), // Black outline
                    ),
                    onPressed: () {
                      // Action for Farmer Login button
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FarmerHome(
                            username: 'Farmer Pickle',
                          ),
                          //lead to option to choose between farmer or consumer
                        ),
                      );
                    },
                    child: const Text(
                      'Farmer Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
