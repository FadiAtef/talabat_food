import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/home/logic/home_cubit.dart';
import 'package:untitled/feature/home/logic/home_state.dart';
import 'package:untitled/feature/home/ui/widgets/food_card.dart';

class ListFood extends StatelessWidget {
  const ListFood({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          final foods = state.recommendedFoods;
          if (foods.isEmpty) {
            return const Center(child: Text('لا توجد وجبات حالياً'));
          }
          return SizedBox(
            height: 245,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return FoodCard(
                  name: food.name ?? 'بدون اسم',
                  restaurant: food.category ?? 'مطعم عام',
                  price: food.price?.toString() ?? '0',
                  rating: '4.8', // Default rating as API might not have it
                  image: food.image ?? '',
                  food: food,
                );
              },
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text('خطأ: ${state.message}'));
        }
        return const SizedBox(
          height: 250,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
