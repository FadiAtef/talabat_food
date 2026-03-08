import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';

class FoodBanner extends StatelessWidget {
  const FoodBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Image.asset(AppAssets.rectangle17407, fit: BoxFit.cover),
    );
  }
}
