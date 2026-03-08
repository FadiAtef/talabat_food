import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final String image;
  const DetailsHeader({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: const BoxDecoration(
        color: Color(0xFFFFF5F5),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: image.startsWith('http')
              ? Image.network(image, fit: BoxFit.contain)
              : Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
