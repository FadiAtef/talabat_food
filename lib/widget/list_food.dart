import 'package:flutter/material.dart';
import 'package:untitled/widget/food_card.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key});

  @override
  Widget build(BuildContext context) {
    List food=[
      FoodCard(name: 'بيج برجر سبيايسي ', restaurant: 'وجبات سريعة', price: '150', rating: '4.5', image: 'asstes/78178740_Fresh beef burger isolated -1 copy 1.png'),
      FoodCard(name: 'فراخ مشوية', restaurant: 'مشويات', price: '130', rating: '4.3', image: 'asstes/78178740_Fresh beef burger isolated -1 copy 1 (1).png'),
      FoodCard(name: 'اسماك', restaurant: 'ماكؤلات بحرية', price: '180', rating: '4.7', image: 'asstes/78178740_Fresh beef burger isolated -1 copy 1 (2).png'),
      FoodCard(name: 'ستيك', restaurant: 'لحوم', price: '200', rating: '4.8', image: 'asstes/78178740_Fresh beef burger isolated -1 copy 1 (3).png'),
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
