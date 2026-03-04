import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/screens/cart_product.dart';
import 'package:untitled/screens/resturant_screen.dart';
import 'package:untitled/screens/favourite_screen.dart';
import 'package:untitled/screens/home_screen_body.dart';
import 'package:untitled/screens/orders.dart';
import 'package:untitled/screens/profile_screen.dart';
import 'package:untitled/screens/track_order.dart';
import 'package:untitled/widget/custom_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreenBody(),
      const FavouriteScreen(),
      const CartProduct(),
      const TrackOrder(),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBody: true,

        backgroundColor: Colors.white,
        body: IndexedStack(index: _selectedIndex, children: _pages),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          shape: const CircleBorder(),
          isExtended: false,
          onPressed: () {
            _onItemTapped(2);
          },
          child: SvgPicture.asset(
            AppAssets.shoppingIcon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
