import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/profile/logic/model/model_item.dart';

class MenuList extends StatelessWidget {
  final List<MenuItem> items;

  const MenuList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => _MenuItemWidget(item: item)).toList(),
    );
  }
}

class _MenuItemWidget extends StatelessWidget {
  final MenuItem item;

  const _MenuItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    // Every icon is primary color
    final Color iconColor = AppTheme.primary;

    final Color bgColor = item.isSelected
        ? AppTheme.primaryLight
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            // RTL: Icon then title
            textDirection: TextDirection.rtl,
            children: [
              // Icon on right side in RTL
              SvgPicture.asset(
                (item.isSelected && item.selectedSvgPath != null)
                    ? item.selectedSvgPath!
                    : item.svgPath,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 14),
              // Title text
              Text(
                item.title,
                style: AppTextStyles.smallTitle.copyWith(
                  color: item.isDestructive ? AppTheme.primary : Colors.black,
                  fontWeight: item.isSelected
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
