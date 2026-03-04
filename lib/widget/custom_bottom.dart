import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, required this.text, required this.colorBottom, required this.colorText});
  final String text;
  final Color colorBottom;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFF55540)),
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
    );
  }
}
