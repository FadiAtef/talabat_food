import 'package:flutter/material.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/home/data/models/food_model.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/navigation/navigation_cubit.dart';
import 'package:untitled/feature/home/ui/screens/details_home_screen.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String restaurant;
  final String price;
  final String rating;
  final String image;
  final FoodModel food;

  const FoodCard({
    super.key,
    required this.name,
    required this.restaurant,
    required this.price,
    required this.rating,
    required this.image,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsHomeScreen(
              name: name,
              image: image,
              price: price,
              description:
                  'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
              food: food,
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3F2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: image.startsWith('http')
                      ? Image.network(
                          image,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image, size: 40),
                        )
                      : Image.asset(image, fit: BoxFit.contain),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.productName.copyWith(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    restaurant,
                    style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                rating,
                                style: AppTextStyles.label.copyWith(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '$price ج.م',
                            style: AppTextStyles.productPrice.copyWith(
                              fontSize: 12,
                              color: const Color(0xFFF55540),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Cart Tab
                          context.read<NavigationCubit>().setTab(2);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF55540),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            AppAssets.group2456,
                            color: Colors.white,
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
