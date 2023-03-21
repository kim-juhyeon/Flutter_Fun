import 'package:daily_page/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: Colors.white, fontFamily: 'parisienne', fontSize: 80.0),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 50.0,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(color: Colors.white, fontSize: 30.0),
          bodySmall: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
