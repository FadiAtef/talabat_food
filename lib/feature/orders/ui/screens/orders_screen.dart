import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/orders/logic/orders_cubit.dart';
import 'package:untitled/feature/orders/ui/widgets/order_item_widget.dart';
import 'package:untitled/widget/custom_app_bar_app.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            // Reusable Header
            const CustomAppBarApp(title: 'طلباتي'),
            const SizedBox(height: 20),

            // Orders List
            Expanded(
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is OrdersLoaded) {
                    if (state.orders.isEmpty) {
                      return const Center(
                        child: Text(
                          'لا توجد طلبات حالياً',
                          style: TextStyle(fontFamily: 'Cairo'),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.orders.length,
                      padding: const EdgeInsets.only(bottom: 100),
                      itemBuilder: (context, index) {
                        return OrderItemWidget(order: state.orders[index]);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
