import 'package:untitled/feature/home/data/models/food_model.dart';

class CartItem {
  final FoodModel food;
  final int quantity;
  final String selectedSize;
  final List<String> selectedExtras;

  CartItem({
    required this.food,
    required this.quantity,
    required this.selectedSize,
    required this.selectedExtras,
  });

  double get totalPrice {
    double basePrice = double.tryParse(food.price.toString()) ?? 0.0;
    // إضافة الحجم (مثال: دبل يزود 0.50)
    if (selectedSize == 'دبل') basePrice += 0.50;
    return basePrice * quantity;
  }
}
