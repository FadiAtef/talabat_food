import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/text_styles.dart';
import 'package:untitled/feature/home/logic/details_cubit.dart';

class DetailsOptions extends StatelessWidget {
  final String selectedSize;
  final List<String> selectedExtras;

  const DetailsOptions({
    super.key,
    required this.selectedSize,
    required this.selectedExtras,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1, color: Color(0xFFF0F0F0), height: 1),
        _buildSectionHeader(title: 'الحجم', isMandatory: true),
        _buildOptionTile(
          context: context,
          title: 'سنجل',
          price: '0.50 د.ك',
          isSelected: selectedSize == 'سنجل',
          onTap: () => context.read<DetailsCubit>().selectSize('سنجل'),
        ),
        _buildOptionTile(
          context: context,
          title: 'دبل',
          price: '0.50 د.ك',
          isSelected: selectedSize == 'دبل',
          onTap: () => context.read<DetailsCubit>().selectSize('دبل'),
        ),
        const SizedBox(height: 16),
        const Divider(thickness: 1, color: Color(0xFFF0F0F0), height: 1),
        _buildSectionHeader(title: 'الإضافات', isMandatory: false),
        _buildOptionTile(
          context: context,
          title: 'سلطة',
          price: '0.00 د.ك',
          isSelected: selectedExtras.contains('سلطة'),
          onTap: () => context.read<DetailsCubit>().toggleExtra('سلطة'),
        ),
        _buildOptionTile(
          context: context,
          title: 'حار',
          price: '0.00 د.ك',
          isSelected: selectedExtras.contains('حار'),
          onTap: () => context.read<DetailsCubit>().toggleExtra('حار'),
        ),
        _buildOptionTile(
          context: context,
          title: 'عادي',
          price: '0.00 د.ك',
          isSelected: selectedExtras.contains('عادي'),
          onTap: () => context.read<DetailsCubit>().toggleExtra('عادي'),
        ),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool isMandatory,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        children: [
          Text(title, style: AppTextStyles.sectionTitle.copyWith(fontSize: 18)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isMandatory
                  ? const Color(0xFFFFF0ED)
                  : const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              isMandatory ? 'الزامي' : 'اختياري',
              style: TextStyle(
                color: isMandatory ? const Color(0xFFF55540) : Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile({
    required BuildContext context,
    required String title,
    required String price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFF55540)
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Color(0xFFF55540),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
