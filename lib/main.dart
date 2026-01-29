import 'package:flutter/material.dart';
import 'package:untitled/widget/custom_appbar.dart';
import 'package:untitled/widget/food_banner.dart';
import 'package:untitled/widget/food_card.dart';
import 'package:untitled/widget/food_catergory.dart';
import 'package:untitled/widget/item_food.dart';
import 'package:untitled/widget/list_food.dart';
import 'package:untitled/widget/search_bar.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Cairo',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF5F5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                CustomAppbar(),

                const SizedBox(height: 12),

                // Search Bar
                SearchItem(),


                const SizedBox(height: 20),

                // Categories Section

              FoodCatergory(),


                const SizedBox(height: 16),

                // Super Food Menu Banner
                FoodBanner(),

                const SizedBox(height: 20),

                // Best Deals Section
                _buildBestDealsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildBestDealsSection() {
    return Column(

      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(

            children: [
              Text(
                'الافضل خلال اليوم  🔥',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ListFood(),
      ],
    );
  }


}