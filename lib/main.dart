import 'package:flutter/material.dart';
import 'home_screen.dart';  // Ensure this file is correctly named and located

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management App',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light, // Add the brightness parameter
          primary: Color(0xFF798645),
          onPrimary: Colors.white,
          secondary: Color(0xFF626F47),
          onSecondary: Colors.white,
          background: Color(0xFFFEFAE0),
          onBackground: Colors.black,
          surface: Color(0xFFF2EED7),
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFFFEFAE0),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF626F47)),
          bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF626F47)),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF798645),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      home: HomeScreen(),  // Ensure this matches the HomeScreen widget
    );
  }
}
