import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class BuildResturentCard extends StatelessWidget {
  const BuildResturentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 115,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                AppAssets.beliciousRestaurant,
                width: 75,
                height: 88,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),

                  const Text(
                    'اسم المطعم هنا',
                    style: AppTextStyles.restaurantName,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.burgerIcon,
                        color: const Color(0xffF55540),
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'طعام بحري , مشويات , اكلات سريعة',
                          style: AppTextStyles.restaurantDetails,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      const Text(' 5.0', style: AppTextStyles.label),
                      SizedBox(width: 4),
                      const Text(' (+100)', style: AppTextStyles.bodyMedium),
                    ],
                  ),
                  SizedBox(width: 4),
                  Row(
                    children: [
                     SizedBox(
                       height:18,
                         width: 18,
                         child: Image.asset(AppAssets.motoIcon,fit: BoxFit.fill,      color: Color(0xffF55540),)),
                      SizedBox(width: 4),
                      Text(
                        ' مجاني التوصيل',
                        style: AppTextStyles.restaurantDetails,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Icon(Icons.favorite_border, size: 22),
                  const SizedBox(height: 12),
                  Icon(Icons.share, size: 22),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
