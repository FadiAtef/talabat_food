import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class CustomScrollableBar extends StatefulWidget {
  const CustomScrollableBar({super.key});

  @override
  State<CustomScrollableBar> createState() => _CustomScrollableBarState();
}

class _CustomScrollableBarState extends State<CustomScrollableBar> {
  int selectedIndex = 1;

  final List<String> categories = [
    '',
    ' 🔥 الافضل',
    'بيتزا',
    'مشويات',
    'حلويات',
    'محاشي',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;

          if (index == 0) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CustomScrollItem(
                isSelected: isSelected,
                child: Image.asset(
                  AppAssets.settingsIcon,
                  height: 24,
                  width: 24,
                  color: const Color(0xffF55540),
                ),
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: CustomScrollItem(
              text: categories[index],
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

class CustomScrollItem extends StatelessWidget {
  final String? text;
  final bool isSelected;
  final Widget? child;

  const CustomScrollItem({
    super.key,
    this.text,
    this.isSelected = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? const Color(0xffF55540) : Colors.grey.shade300,
        ),
      ),
      child: child ?? Text(text ?? '', style: AppTextStyles.tabBarCategory),
    );
  }
}
