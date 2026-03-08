import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/feature/home/ui/screens/home_screen_body.dart';
import 'package:untitled/feature/favorite/ui/screens/favorite_screen.dart';
import 'package:untitled/feature/cart/ui/screens/cart_screen.dart';
import 'package:untitled/feature/orders/ui/screens/orders_screen.dart';
import 'package:untitled/feature/profile/ui/screens/profile_screen.dart';
import 'package:untitled/feature/navigation/ui/widgets/custom_bottom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/navigation/navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreenBody(),
      const FavoriteScreen(),
      const CartScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];

    return BlocBuilder<NavigationCubit, NavigationTab>(
      builder: (context, currentTab) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            extendBody: true,
            backgroundColor: AppTheme.white,
            body: IndexedStack(index: currentTab.index, children: pages),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppTheme.primary,
              shape: const CircleBorder(),
              onPressed: () => context.read<NavigationCubit>().setTab(2),
              child: SvgPicture.asset(
                AppAssets.shoppingIcon,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNav(
              selectedIndex: currentTab.index,
              onItemTapped: (index) =>
                  context.read<NavigationCubit>().setTab(index),
            ),
          ),
        );
      },
    );
  }
}
