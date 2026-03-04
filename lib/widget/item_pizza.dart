import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';

class ItemPizza extends StatelessWidget {
   ItemPizza({
    super.key,
    required this.title,
    required this.description,
    required this.price,
     required this.showDivider,  this.child,
  });
  final String title;
  final String description;
  final String price;
   bool showDivider=true;
   final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  AppAssets.pizza,
                  width: 105.5,
                  height: 105.5,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),

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
                         Text(
                       price,
                          style: AppTextStyles.bodyLarge,
                        ),
                        ?child,
                    ],
                    ),
                  ],
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
                  child: Divider(
                    height: 8,
                    color: Color(0xffE4E4E4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
