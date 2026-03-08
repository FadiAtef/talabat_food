import 'package:flutter/material.dart';

class EditProfileFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController nationalIdController;

  const EditProfileFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.nationalIdController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildField('إسم المستخدم', nameController, Icons.person_outline),
        const SizedBox(height: 20),
        _buildField('البريد الإلكتروني', emailController, Icons.email_outlined),
        const SizedBox(height: 20),
        _buildField('الموبايل', phoneController, Icons.phone_android_outlined),
        const SizedBox(height: 20),
        _buildField(
          'الرقم القومي',
          nationalIdController,
          Icons.credit_card_outlined,
        ),
      ],
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }
}
