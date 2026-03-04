import 'package:flutter/material.dart';
import 'package:untitled/core/text_styles.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(title, style: AppTextStyles.sectionTitle),
          ),
        ],
      ),
    );
  }
}
