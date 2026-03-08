import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/orders/data/models/order_model.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;
  const OrderItemWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDelivered = order.status == 'تم التسليم';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Order Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 80,
              height: 80,
              color: const Color(0xFFF3F3F3),
              child: order.image.endsWith('.svg')

                  ? SvgPicture.asset(AppAssets.cartImage1, fit: BoxFit.contain)
                  : Image.asset(
                      AppAssets.cartImage1,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.fastfood, color: Colors.grey),
                    ),
            ),
          ),
          const SizedBox(width: 12),

          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'رقم الطلب: #${order.orderId}',
                  style: AppTextStyles.smallTitle,
                ),
                const SizedBox(height: 4),
                Text(
                  order.date,
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),

          // Status and Action
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isDelivered
                      ? const Color(0xFFE8F5E9)
                      : AppTheme.primaryLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order.status,
                  style: AppTextStyles.label.copyWith(
                    color: isDelivered ? Colors.green : AppTheme.primary,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Action Button
              GestureDetector(
                onTap: () {
                  // Order again logic
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'طلب مره اخري',
                    style: AppTextStyles.buttonMedium.copyWith(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
