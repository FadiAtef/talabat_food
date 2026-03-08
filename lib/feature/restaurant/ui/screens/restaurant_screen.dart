import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/feature/restaurant/logic/restaurant_cubit.dart';
import 'package:untitled/feature/restaurant/ui/widgets/best_product_explore.dart';
import 'package:untitled/feature/restaurant/ui/widgets/build_resturent_card.dart';
import 'package:untitled/widget/build_title.dart';
import 'package:untitled/feature/cart/ui/widgets/custom_bottom_bar.dart';
import 'package:untitled/feature/restaurant/ui/widgets/custom_scroll_item.dart';
import 'package:untitled/feature/restaurant/ui/widgets/pizza_product_list.dart';

import 'package:untitled/feature/navigation/navigation_cubit.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          backgroundColor: const Color(0xFFFFF5F5),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(AppAssets.banner2, fit: BoxFit.fill),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Color(0xFFF55540),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const BuildResturentCard(),
                  const SizedBox(height: 12),
                  const CustomScrollableBar(),
                  const SizedBox(height: 16),
                  const BuildTitle(title: ' 🔥 الأفضل'),
                  const SizedBox(height: 12),
                  BestProductExplore(),
                  const SizedBox(height: 12),
                  const BuildTitle(title: ' 🍕  بيتزا '),
                  const SizedBox(height: 8),
                  const PizzaProductList(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CartBottomBar(
            totalPrice: 153.00,
            itemCount: 1,
            onTap: () {
              Navigator.pop(context);
              context.read<NavigationCubit>().setTab(2);
            },
          ),
        );
      },
    );
  }
}
