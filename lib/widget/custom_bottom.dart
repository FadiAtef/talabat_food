import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.text,
    required this.colorBottom,
    required this.colorText,
    this.onTap,
  });

  final String text;
  final Color colorBottom;
  final Color colorText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF55540)),
            borderRadius: BorderRadius.circular(8),
            color: colorBottom,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: colorText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
