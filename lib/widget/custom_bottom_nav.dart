import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Widget buildNavItem(String svgPath, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.red : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 3,
              width: isSelected ? 18 : 0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
shadowColor: Colors.red,
      shape: const CircularNotchedRectangle(), // 🔥 ده اللي بيعمل النوتش
      notchMargin: 8,
      elevation: 10,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem(AppAssets.homeIcon, 0),
            buildNavItem(AppAssets.heartIcon, 1),

            const SizedBox(width: 60), // 🔥 مساحة مكان الـ FAB

            buildNavItem(AppAssets.cartIcon, 3),
            buildNavItem(AppAssets.personIcon, 4),
          ],
        ),
      ),
    );
  }
}