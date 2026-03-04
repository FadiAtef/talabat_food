import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/widget/best_product_explore.dart';
import 'package:untitled/widget/build_resturent_card.dart';
import 'package:untitled/widget/build_title.dart';
import 'package:untitled/widget/custom_bottom_bar.dart';
import 'package:untitled/widget/custom_scroll_item.dart';
import 'package:untitled/widget/pizza_product_list.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedCategoryIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(AppAssets.banner2, fit: BoxFit.fill),
                    ),
                    SizedBox(height: 12),

                    BuildResturentCard(),

                    const SizedBox(height: 12),

                    CustomScrollableBar(),

                    const SizedBox(height: 16),

                    BuildTitle(title: ' 🔥 الأفضل'),

                    const SizedBox(height: 12),

                    BestProductExplore(),

                    const SizedBox(height: 12),

                    BuildTitle(title: ' 🍕  بيتزا '),

                    const SizedBox(height: 8),
                    PizzaProductList(),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: CartBottomBar(
        totalPrice: 0.00,
        itemCount: 0,
        onTap: () {},
      ),
    );
  }
}
