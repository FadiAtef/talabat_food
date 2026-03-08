import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Color((0xffF55540)))
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xffF55540),size: 30,),
            const SizedBox(width: 14),
            const Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'ابحث عن وجبة معينة',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
