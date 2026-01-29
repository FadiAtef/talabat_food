import 'package:flutter/material.dart';
import 'package:untitled/widget/item_food.dart';

class FoodCatergory extends StatelessWidget {
   FoodCatergory({super.key});
  final categories = [
    {
      'name': 'لحوم',
      'image': 'asstes/78178740_Fresh beef burger isolated -1 copy 1 (3).png',
      'color': const Color(0xFF98E6D5)
    },
    {
      'name': 'مأكولات بحرية',
      'image': 'asstes/78178740_Fresh beef burger isolated -1 copy 1 (2).png',
      'color': const Color(0xFFFFB366)
    },
    {
      'name': 'مشويات',
      'image': 'asstes/78178740_Fresh beef burger isolated -1 copy 1 (1).png',
      'color': const Color(0xFFFFCC99)
    },
    {
      'name': 'وجبات سريعة',
      'image': 'asstes/78178740_Fresh beef burger isolated -1 copy 1.png',
      'color': const Color(0xFFFF6B6B)
    },
  ];
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ItemFood(name: 'وجبات سريعة',image: 'asstes/78178740_Fresh beef burger isolated -1 copy 1.png',color:const Color(0xFFFF6B6B) ,),
          ItemFood(name: 'مشويات',image:'asstes/78178740_Fresh beef burger isolated -1 copy 1 (1).png' ,color:const Color(0xFFFFCC99) ,),
          ItemFood(name:'ماكؤلات بحرية' ,image:'asstes/78178740_Fresh beef burger isolated -1 copy 1 (2).png' ,color: const Color(0xFFFFB366) ,),
          ItemFood(name: 'لحوم',image:'asstes/78178740_Fresh beef burger isolated -1 copy 1 (3).png' ,color: const Color(0xFF98E6D5),),
        ],
      ),
    );
  }
}
