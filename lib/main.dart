import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'InitialPages/SignUpScreen.dart';
import 'InitialPages/MyHomePage.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized(); //chatbot ke liye added
//   runApp(const MyApp());
//   //ProviderScope(child: MyApp());
// }
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitialScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool? _isSignedUp; // Track if the user is signed up or not

  @override
  void initState() {
    super.initState();
    _checkSignUpStatus();
  }

  // Check if user is signed up
  Future<void> _checkSignUpStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSignedUp =
        prefs.getBool('isSignedUp') ?? false; // Default to false if not set
    setState(() {
      _isSignedUp = isSignedUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // While checking the sign-up status, show loading spinner
    if (_isSignedUp == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Navigate based on sign-up status
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the app bar color to white
        title: const Text(
          'App Title',
          style: TextStyle(color: Colors.black), // Title color for contrast
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg2.png'), // Set background image
            fit: BoxFit.cover,
          ),
        ),
        child: _isSignedUp!
            ? MyHomePage(
                username: 'Cookie',
              ) // If signed up, navigate to home page
            : SignUpScreen(), // If not signed up, navigate to sign-up screen
      ),
    );
  }
}
