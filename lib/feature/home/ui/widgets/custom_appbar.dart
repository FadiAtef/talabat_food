import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/profile/logic/profile_cubit.dart';
import 'package:untitled/feature/profile/logic/profile_state.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Image
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              String? imagePath;
              if (state is ProfileLoaded) {
                imagePath = state.profile.imagePath;
              }
              return Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF55540), width: 2),
                ),
                child: ClipOval(
                  child: imagePath != null && imagePath.isNotEmpty
                      ? Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                                AppAssets.profileImage,
                                fit: BoxFit.cover,
                              ),
                        )
                      : Image.asset(AppAssets.profileImage, fit: BoxFit.cover),
                ),
              );
            },
          ),

          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'الموقع الحالي',
                    style: AppTextStyles.appBarLocationTitle,
                  ),
                  const SizedBox(width: 4),
                  Image.asset(AppAssets.locationIcon, width: 30),
                ],
              ),
              const Text(
                '19 شارع أحمد الصاوي، مدينة نصر  ',
                style: AppTextStyles.appBarLocationSubtitle,
              ),
            ],
          ),

          // Notifications Icon
          SvgPicture.asset(AppAssets.notificationIcon, width: 28, height: 28),
        ],
      ),
    );
  }
}
