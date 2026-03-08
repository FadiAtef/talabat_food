import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/feature/profile/logic/profile_cubit.dart';
import 'package:untitled/feature/profile/logic/profile_state.dart';

import 'package:untitled/feature/profile/ui/screens/edit_profile_screen.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfileScreen()),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          const _AvatarContainer(),
          Positioned(bottom: 10, right: 10, child: const _CameraButton()),
        ],
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        String? imagePath;
        if (state is ProfileLoaded) {
          imagePath = state.profile.imagePath;
        }

        return Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ), // Padding to show the background color as a border
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imagePath != null
                  ? Image.file(File(imagePath), fit: BoxFit.cover)
                  : Image.asset(AppAssets.profileImage, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}

class _CameraButton extends StatelessWidget {
  const _CameraButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.camera_alt_outlined,
        color: Color(0xFFF55540),
        size: 18,
      ),
    );
  }
}
