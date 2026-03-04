import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_assets.dart';

class CustomAppBarApp extends StatelessWidget {
  const CustomAppBarApp({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffF55540),
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppAssets.vectorIcon1),
            ),
          ),
           Text(
          title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
         SvgPicture.asset(AppAssets.notificationIcon,width: 24,height: 24,),
        ],
      ),
    );
  }
}
