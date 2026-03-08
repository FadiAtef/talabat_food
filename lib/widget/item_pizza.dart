import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class ItemPizza extends StatelessWidget {
  const ItemPizza({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.showDivider,
    this.image,
    this.child,
  });
  final String title;
  final String description;
  final String price;
  final bool showDivider;
  final String? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.productName.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyles.productDescription,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(price, style: AppTextStyles.bodyLarge),
                        if (child != null) child!,
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 90,
                height: 90,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: image == null || image!.isEmpty
                      ? Image.asset(AppAssets.pizza, fit: BoxFit.contain)
                      : image!.startsWith('http')
                      ? Image.network(image!, fit: BoxFit.contain)
                      : Image.asset(image!, fit: BoxFit.contain),
                ),
              ),
            ],
          ),

          Visibility(
            visible: showDivider,
            child: Column(
              children: const [
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(height: 8, color: Color(0xffE4E4E4)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
