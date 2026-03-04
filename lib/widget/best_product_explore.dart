import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class BestProductExplore extends StatelessWidget {
  BestProductExplore({super.key});
  int selectedIndex = 1;

  final List<String> categories = AppAssets.bestProducts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 2,
          childAspectRatio: 0.98,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildProductCard(
            image: categories[index],
            name: 'معكرونه بالصوص و قطع بانية حار',
            price: '2.20',
          );
        },
      ),
    );
  }

  Widget _buildProductCard({
    required String image,
    required String name,
    required String price,
  }) {
    return Container(

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('$price  د.ك ', style: AppTextStyles.productPrice),
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
