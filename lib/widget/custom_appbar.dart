import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset('asstes/images/Rectangle 17405 (1).png',fit: BoxFit.fill,),
          ),

          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'الموقع الحالي',
                    style: AppTextStyles.appBarLocationTitle,
                  ),
                  const SizedBox(width: 4),
                  Image.asset(AppAssets.locationIcon, width: 30),
                ],
              ),
              const Text(
                '19 شارع أحمد الصاوي، مدينة نصر  ',
                style: AppTextStyles.appBarLocationSubtitle,
              ),
            ],
          ),
          const Icon(Icons.notifications_none_sharp, size: 30),
        ],
      ),
    );
  }
}
