import 'dart:io';
import 'package:flutter/material.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/core/app_theme.dart';

class EditProfileAvatar extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onCameraTap;

  const EditProfileAvatar({
    super.key,
    this.imagePath,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(36),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(34),
            child: imagePath != null
                ? Image.file(File(imagePath!), fit: BoxFit.cover)
                : Image.asset(AppAssets.profileImage, fit: BoxFit.cover),
          ),
        ),
        GestureDetector(
          onTap: onCameraTap,
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
