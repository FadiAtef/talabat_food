import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/feature/profile/logic/model/model_item.dart';
import 'package:untitled/feature/profile/ui/widgets/menu_list.dart';
import 'package:untitled/feature/profile/ui/widgets/profile_app_bar.dart';
import 'package:untitled/feature/profile/ui/widgets/profile_avatar.dart';

import 'package:untitled/feature/profile/ui/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Current selected item index
  int _selectedIndex = 0;

  List<MenuItem> _menuItems(BuildContext context) => [
    MenuItem(
      title: 'تعديل حسابي',
      svgPath: AppAssets.editProfileIcon,
      selectedSvgPath:
          AppAssets.editProfileSelectedIcon, // Solid/Dark icon version
      isSelected: _selectedIndex == 0,
      onTap: () {
        setState(() => _selectedIndex = 0);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfileScreen()),
        );
      },
    ),
    MenuItem(
      title: 'دعوة صديق',
      svgPath: AppAssets.inviteFriendIcon,
      isSelected: _selectedIndex == 1,
      onTap: () {
        setState(() => _selectedIndex = 1);
      },
    ),
    MenuItem(
      title: 'عن التطبيق و الجوائز',
      svgPath: AppAssets.aboutAppIcon,
      isSelected: _selectedIndex == 2,
      onTap: () {
        setState(() => _selectedIndex = 2);
      },
    ),
    MenuItem(
      title: 'شروط الاستخدام',
      svgPath: AppAssets.termsIcon,
      isSelected: _selectedIndex == 3,
      onTap: () {
        setState(() => _selectedIndex = 3);
      },
    ),
    MenuItem(
      title: 'حذف حساب',
      svgPath: AppAssets.deleteAccountIcon,
      isSelected: _selectedIndex == 4,
      onTap: () {
        setState(() => _selectedIndex = 4);
      },
      isDestructive: true,
    ),
    MenuItem(
      title: 'تسجيل خروج',
      svgPath: AppAssets.logoutIcon,
      isSelected: _selectedIndex == 5,
      onTap: () {
        setState(() => _selectedIndex = 5);
      },
      isDestructive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const ProfileAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const ProfileAvatar(),
                      const SizedBox(height: 40),
                      // Pass updated menu items based on selection
                      MenuList(items: _menuItems(context)),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
