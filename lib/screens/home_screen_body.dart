import 'package:flutter/material.dart';
import 'package:untitled/widget/best_section.dart';
import 'package:untitled/widget/custom_appbar.dart';
import 'package:untitled/widget/food_banner.dart';
import 'package:untitled/widget/food_catergory.dart';
import 'package:untitled/widget/search_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

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
                BestSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
