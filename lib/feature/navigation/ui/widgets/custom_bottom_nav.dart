import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Widget _buildNavItem(String svgPath, String selectedSvgPath, int index) {
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
              isSelected ? selectedSvgPath : svgPath,
              width: 24,
              height: 24,
              colorFilter: isSelected
                  ? null
                  : const ColorFilter.mode(AppTheme.textDark, BlendMode.srcIn),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 3,
              width: isSelected ? 18 : 0,
              decoration: BoxDecoration(
                color: AppTheme.primary,
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
      shadowColor: AppTheme.primary,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 10,
      color: AppTheme.white,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(AppAssets.homeIcon, AppAssets.homeSelectedIcon, 0),
            _buildNavItem(AppAssets.heartIcon, AppAssets.heartSelectedIcon, 1),

            const SizedBox(width: 60), // مساحة مكان الـ FAB

            _buildNavItem(AppAssets.cartIcon, AppAssets.cartSelectedIcon, 3),
            _buildNavItem(
              AppAssets.personIcon,
              AppAssets.personSelectedIcon,
              4,
            ),
          ],
        ),
      ),
    );
  }
}
