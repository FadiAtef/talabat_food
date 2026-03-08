import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/cart/logic/cart_cubit.dart';
import 'package:untitled/feature/cart/data/models/cart_item.dart';
import 'package:untitled/widget/custom_app_bar_app.dart';
import 'package:untitled/widget/item_pizza.dart';
import 'package:untitled/feature/cart/ui/widgets/payment_summary_widget.dart';
import 'package:untitled/feature/cart/logic/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 140,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const CustomAppBarApp(title: 'عربة التسوق'),
                    const SizedBox(height: 20),

                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state.items.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 100),
                                SvgPicture.asset(
                                  AppAssets.cartImage1,
                                  width: 250,
                                  height: 250,
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'عربة التسوق فارغة',
                                  style: AppTextStyles.mediumTitle.copyWith(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return Column(
                          children: state.items.map((item) {
                            return ItemPizza(
                              showDivider: true,
                              title: item.food.name ?? '',
                              description: item.food.description ?? '',
                              price:
                                  '${item.totalPrice.toStringAsFixed(2)}  ج.م ',
                              image: item.food.image ?? '',
                              child: _buildItemDetails(item),
                            );
                          }).toList(),
                        );
                      },
                    ),

                    const SizedBox(height: 10),

                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state.items.isEmpty) return const SizedBox();
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

            Positioned(
              left: 0,
              right: 0,
              bottom: 100,
              child: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state.items.isEmpty) return const SizedBox();
                  return _buildCheckoutSection(state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemDetails(CartItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الحجم: ${item.selectedSize}',
          style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
        ),
        if (item.selectedExtras.isNotEmpty)
          Text(
            'الإضافات: ${item.selectedExtras.join(', ')}',
            style: AppTextStyles.bodySmall.copyWith(color: Colors.grey),
          ),
        Text(
          'الكمية: ${item.quantity}',
          style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCheckoutSection(CartState state) {
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
                    color: AppTheme.primary,
                  ),
                ),
                Text(
                  '${state.total.toStringAsFixed(2)} ج.م',
                  style: AppTextStyles.sectionTitle.copyWith(
                    color: AppTheme.primary,
                    fontSize: 18,
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
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
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
