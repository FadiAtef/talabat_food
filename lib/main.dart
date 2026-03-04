import 'package:flutter/material.dart';
import 'package:untitled/home_screen.dart';

void main() {
  runApp(const FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'SA'),

      home: const HomeScreen(),
    );
  }
}







