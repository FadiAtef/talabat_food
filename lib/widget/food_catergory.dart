import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/widget/item_food.dart';

class FoodCatergory extends StatelessWidget {
  FoodCatergory({super.key});
  final categories = [
    {
      'name': 'لحوم',
      'image': AppAssets.burger4,
      'color': const Color(0xFF98E6D5),
    },
    {
      'name': 'مأكولات بحرية',
      'image': AppAssets.burger3,
      'color': const Color(0xFFFFB366),
    },
    {
      'name': 'مشويات',
      'image': AppAssets.burger2,
      'color': const Color(0xFFFFCC99),
    },
    {
      'name': 'وجبات سريعة',
      'image': AppAssets.burger1,
      'color': const Color(0xFFFF6B6B),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemFood(
            name: 'وجبات سريعة',
            image: AppAssets.burger1,
            color: const Color(0xFFFF6B6B),
          ),
          ItemFood(
            name: 'مشويات',
            image: AppAssets.burger2,
            color: const Color(0xFFFFCC99),
          ),
          ItemFood(
            name: 'ماكؤلات بحرية',
            image: AppAssets.burger3,
            color: const Color(0xFFFFB366),
          ),
          ItemFood(
            name: 'لحوم',
            image: AppAssets.burger4,
            color: const Color(0xFF98E6D5),
          ),
        ],
      ),
    );
  }
}
