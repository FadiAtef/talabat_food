import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';

class TrackingItemWidget extends StatelessWidget {
  const TrackingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              AppAssets.pizza,
              width: 100.5,
              height: 100.5,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'معكرونه بالصوص و قطع بانية حار',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '2.20  د.ك ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
