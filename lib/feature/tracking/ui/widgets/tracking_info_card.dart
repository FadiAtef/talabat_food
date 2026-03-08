import 'package:flutter/material.dart';

class TrackingInfoCard extends StatelessWidget {
  const TrackingInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'رقم التعريف بالطلب',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                '#8456156',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'كود التحقق',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                '1973',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'عدد العناصر',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
