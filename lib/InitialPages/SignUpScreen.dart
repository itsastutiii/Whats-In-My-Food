import 'package:flutter/material.dart';
import 'package:flutter_application_1/InitialPages/LoginChoice.dart';
import 'package:flutter_application_1/InitialPages/MyHomePage.dart';
import 'package:flutter_application_1/InitialPages/SurveyScreen.dart';
import 'package:flutter_application_1/InitialPages/LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: Image.asset(
                "assets/bg2.png",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text("Image not found or loading error."));
                },
              ),
            ),
          ),
          // Centered Sign Up / Login buttons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sign Up Button
                SizedBox(
                  width: 250,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SurveyScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Login Button
                SizedBox(
                  width: 250,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to the Login Screen when Login is clicked
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                          //lead to option to choose between farmer or consumer
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
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
