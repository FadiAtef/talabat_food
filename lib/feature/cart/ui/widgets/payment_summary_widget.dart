import 'package:flutter/material.dart';
import 'package:untitled/core/text_styles.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final double total;

  const PaymentSummaryWidget({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  Widget buildRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isBold
                ? AppTextStyles.label.copyWith(fontSize: 16)
                : AppTextStyles.bodyMedium.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                  ),
          ),
          Text(
            value,
            style: isBold
                ? AppTextStyles.label.copyWith(fontSize: 16)
                : AppTextStyles.bodyMedium.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ملخص الدفع",
            style: AppTextStyles.sectionTitle.copyWith(fontSize: 18),
          ),
          const SizedBox(height: 12),
          buildRow("المجموع الفرعي", "${subtotal.toStringAsFixed(2)} ج.م"),
          buildRow("التوصيل", "${deliveryFee.toStringAsFixed(2)} ج.م"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Divider(color: Color(0xffE4E4E4)),
          ),
          buildRow(
            "المبلغ الإجمالي",
            "${total.toStringAsFixed(2)} ج.م",
            isBold: true,
          ),
        ],
      ),
    );
  }
}
