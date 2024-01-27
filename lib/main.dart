// import 'package:coffee_shop_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:midterm_640710566/pages/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm 2/2566',
      theme: ThemeData(
        // scaffoldBackgroundColor: Color(0xFF0C0F14),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}
