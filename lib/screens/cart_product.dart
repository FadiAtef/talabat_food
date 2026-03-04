import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/contorller/cubit/counter_cubit.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/widget/custom_app_bar_app.dart';
import 'package:untitled/widget/item_pizza.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Stack(
        children: [
          /// المحتوى القابل للتمرير (AppBar + Items + Payment Summary)
          Positioned.fill(
            bottom: 140, // مساحة للجزء الثابت في الأسفل
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  CustomAppBarApp(title: 'عربة التسوق'),
                  const SizedBox(height: 20),

                  /// عنصر المنتج
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return ItemPizza(
                        showDivider: false,
                        title: 'معكرونه بالصوص و قطع بانية حار',
                        description:
                            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة',
                        price: '${state.itemPrice.toStringAsFixed(2)}  ج.م ',
                        child: _buildQuantitySelector(context, state),
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  /// ملخص الدفع
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return PaymentSummaryWidget(
                        subtotal: state.subtotal,
                        deliveryFee: state.deliveryFee,
                        total: state.total,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          /// الجزء الثابت في الأسفل (الإجمالي + زر إتمام الشراء)
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return _buildCheckoutSection(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(BuildContext context, CounterState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove, color: Color(0xffF55540)),
          ),
          const SizedBox(width: 16),
          Text(
            state.count.toInt().toString(),
            style: AppTextStyles.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add, color: Color(0xffF55540)),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(CounterState state) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'الإجمالي:',
                  style: AppTextStyles.smallTitle.copyWith(
                    color: const Color(0xffF55540),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  '${state.total.toStringAsFixed(2)} ج.م',
                  style: AppTextStyles.sectionTitle.copyWith(
                    color: const Color(0xffF55540),fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffF55540),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Text(
                'إتمام عملية الشراء',
                style: AppTextStyles.buttonLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
