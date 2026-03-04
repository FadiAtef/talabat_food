import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/widget/food_card.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key});

  @override
  Widget build(BuildContext context) {
    List food = [
      FoodCard(
        name: 'بيج برجر سبيايسي ',
        restaurant: 'وجبات سريعة',
        price: '150',
        rating: '4.5',
        image: AppAssets.burger1,
      ),
      FoodCard(
        name: 'فراخ مشوية',
        restaurant: 'مشويات',
        price: '130',
        rating: '4.3',
        image: AppAssets.burger2,
      ),
      FoodCard(
        name: 'اسماك',
        restaurant: 'ماكؤلات بحرية',
        price: '180',
        rating: '4.7',
        image: AppAssets.burger3,
      ),
      FoodCard(
        name: 'ستيك',
        restaurant: 'لحوم',
        price: '200',
        rating: '4.8',
        image: AppAssets.burger4,
      ),
    ];
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),

        itemCount: food.length,
        itemBuilder: (context, index) {
          return food[index];
        },
      ),
    );
  }
}
