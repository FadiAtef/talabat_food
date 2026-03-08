import 'package:flutter/material.dart';

class DetailsActions extends StatelessWidget {
  const DetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(Icons.notifications_none, color: Colors.black),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFF55540),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
