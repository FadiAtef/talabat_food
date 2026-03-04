import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class FoodCard extends StatelessWidget {
  FoodCard({
    super.key,
    required this.name,
    required this.restaurant,
    required this.price,
    required this.rating,
    required this.image,
  });

  final String name;
  final String restaurant;
  final String price;
  final String rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.grey.shade300,
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 110,

              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 110,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Image.asset(image),
                );
              },
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                ),

                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.productName.copyWith(fontSize: 13),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      restaurant,
                      style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
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
                              price,
                              style: AppTextStyles.productPrice.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF55540),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(AppAssets.group2456),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
