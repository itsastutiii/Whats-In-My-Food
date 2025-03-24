import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_application_1/InitialPages/LoginChoice.dart';
import 'package:flutter_application_1/InitialPages/MyHomePage.dart';
import 'package:flutter_application_1/InitialPages/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove the shadow
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            ); // Navigate back to the previous screen
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(
                "assets/bg2.png", // Ensure the image exists in your assets
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text("Image not found or loading error."));
                },
              ),
            ),
          ),
          // Login Form UI wrapped in a Center widget
          Center(
            // Ensures that the entire content is centered
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centering vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centering horizontally
                children: [
                  // Welcome Text
                  const Text(
                    "Welcome Back! ✨",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center, // Centered text
                  ),
                  const SizedBox(height: 30),

                  // Username Field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Username:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 8), // Increased gap between label and textbox
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "Enter your username",
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 8), // Increased gap between label and textbox
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // Hide text input
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  SizedBox(
                    width: 250, // Reduced width for smaller button size
                    height: 50, // Reduced height for smaller button size
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login action (send data to backend, etc.)
                        String username = _usernameController.text;
                        String password = _passwordController.text;

                        // For now, just print the values for demo
                        print("Username: $username, Password: $password");

                        // You can handle login logic or navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(username: 'Cookie'),
                          ),
                        );
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 16, // Reduced font size
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Colors.black, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
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
