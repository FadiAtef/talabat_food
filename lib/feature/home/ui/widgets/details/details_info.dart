import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/home/logic/details_cubit.dart';

class DetailsInfo extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final int quantity;

  const DetailsInfo({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: AppTextStyles.sectionTitle.copyWith(fontSize: 22)),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyles.productDescription.copyWith(
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuantitySelector(context),
              Text(
                '$price د.ك',
                style: AppTextStyles.productPrice.copyWith(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.read<DetailsCubit>().increment(),
            child: const Icon(Icons.add, color: Color(0xFFF55540), size: 20),
          ),
          const SizedBox(width: 16),
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => context.read<DetailsCubit>().decrement(),
            child: Icon(
              Icons.remove,
              color: quantity > 1
                  ? const Color(0xffF55540)
                  : Colors.grey.shade300,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
