import 'package:flutter/material.dart';

class ItemFood extends StatelessWidget {
  const ItemFood({super.key,required this.name,required this.image,required this.color});
  final String name;
final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child:
      Container(

            margin: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Container(
                  width: 85,
                  height: 90,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset(
                     image,
                      fit: BoxFit.contain,

                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),


    );
  }
}
