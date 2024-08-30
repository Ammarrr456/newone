import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Ensure this path is correct
import 'WelcomePage.dart'; // Replace with your actual home widget

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(), // Initialize CartModel
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meatoes',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WelcomePage(), // Replace with your actual home widget
    );
  }
}
