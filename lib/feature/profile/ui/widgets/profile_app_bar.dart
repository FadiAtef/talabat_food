import 'package:flutter/material.dart';
import 'package:untitled/core/text_styles.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: const Center(
        child: Text('حسابي', style: AppTextStyles.sectionTitle),
      ),
    );
  }
}
