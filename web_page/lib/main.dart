import 'package:flutter/material.dart';
import 'package:web_page/screen/Home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}
