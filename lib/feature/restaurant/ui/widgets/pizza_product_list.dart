import 'package:flutter/material.dart';
import 'package:untitled/widget/item_pizza.dart';

class PizzaProductList extends StatelessWidget {
  const PizzaProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ItemPizza(
            title: 'معكرونه بالصوص و قطع بانية حار',
            description:
                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.',
            price: '2.20',
            showDivider: true,
          );
        },
      ),
    );
  }
}
