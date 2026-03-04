import 'package:flutter/material.dart';
import 'package:untitled/widget/list_food.dart';

class BestSection extends StatelessWidget {
  const BestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(

            children: [
              Text(
                'الافضل خلال اليوم  🔥',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ListFood(),
      ],
    );
  }
}
