import 'package:flutter/material.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/home/data/models/food_model.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';

class FavoriteItemWidget extends StatelessWidget {
  final FoodModel food;
  final VoidCallback onToggleFavorite;
  final VoidCallback onAddToCart;

  const FavoriteItemWidget({
    super.key,
    required this.food,
    required this.onToggleFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Food Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: food.image == null || food.image!.isEmpty
                ? Image.asset(
                    AppAssets.pizza,
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                  )
                : food.image!.startsWith('http')
                ? Image.network(
                    food.image!,
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      AppAssets.pizza,
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    food.image!,
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      AppAssets.pizza,
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name ?? 'اسم الوجبة هنا',
                  style: AppTextStyles.mediumTitle.copyWith(fontSize: 18),
                ),
                Text(
                  food.category ?? 'اسم المطعم',
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '0.0',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(0)',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${food.price ?? 250}\$',
                      style: AppTextStyles.mediumTitle.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Actions
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onToggleFavorite,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.favorite, color: AppTheme.primary),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: onAddToCart,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppTheme.primary,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
