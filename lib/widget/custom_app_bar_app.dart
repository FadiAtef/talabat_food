import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/core/text_styles.dart';

class CustomAppBarApp extends StatelessWidget {
  const CustomAppBarApp({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title in center
            Text(title, style: AppTextStyles.sectionTitle),
          ],
        ),
      ),
    );
  }
}
