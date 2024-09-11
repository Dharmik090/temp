import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screens/Profile.dart';
import 'package:flutter_application/screens/Home.dart';
import 'package:flutter_application/screens/PropertyDetails.dart';
import 'package:flutter_application/screens/LogIn.dart';
import 'package:flutter_application/screens/SignUp.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
   _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set the theme based on the current state
      routes: {
        '/home': (context) => HomeScreen(isDarkTheme: _isDarkTheme, onThemeChange: _toggleTheme),
        '/profile': (context) => Profile(isDarkTheme: _isDarkTheme, onThemeChange: _toggleTheme),
        '/details': (context) => PropertyDetails(isDarkTheme: _isDarkTheme, onThemeChange: _toggleTheme),
        '/signup': (context) => SignUp(isDarkTheme: _isDarkTheme, onThemeChange: _toggleTheme),
        '/login': (context) => LogIn(isDarkTheme: _isDarkTheme, onThemeChange: _toggleTheme)
      },
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        isDarkTheme: _isDarkTheme,
        onThemeChange: _toggleTheme,
      ),
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }
}
