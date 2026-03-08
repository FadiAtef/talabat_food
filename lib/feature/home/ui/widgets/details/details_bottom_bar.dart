import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/navigation/navigation_cubit.dart';
import 'package:untitled/feature/cart/logic/cart_cubit.dart';
import 'package:untitled/feature/cart/data/models/cart_item.dart';
import 'package:untitled/feature/home/data/models/food_model.dart';

class DetailsBottomBar extends StatelessWidget {
  final String price;
  final int quantity;
  final FoodModel food;
  final String selectedSize;
  final List<String> selectedExtras;

  const DetailsBottomBar({
    super.key,
    required this.price,
    required this.quantity,
    required this.food,
    required this.selectedSize,
    required this.selectedExtras,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {
          // Add to Cart
          context.read<CartCubit>().addToCart(
            CartItem(
              food: food,
              quantity: quantity,
              selectedSize: selectedSize,
              selectedExtras: List.from(selectedExtras),
            ),
          );

          // Open Cart Tab
          Navigator.pop(context);
          context.read<NavigationCubit>().setTab(2);
        },
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: const Color(0xFFF55540),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFF55540).withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Text(
                '${(double.tryParse(price.replaceAll(' د.ك', '')) ?? 0) * quantity} ج.م',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Text(
                'إضافة للسلة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$quantity',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
