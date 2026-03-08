import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String svgPath;
  final String? selectedSvgPath;
  final VoidCallback? onTap;
  final bool isDestructive;
  final bool isSelected;

  const MenuItem({
    required this.title,
    required this.svgPath,
    this.selectedSvgPath,
    this.onTap,
    this.isDestructive = false,
    this.isSelected = false,
  });
}
