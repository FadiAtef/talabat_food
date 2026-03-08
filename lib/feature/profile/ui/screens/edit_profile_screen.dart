import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/feature/profile/logic/model/profile_form_data.dart';
import 'package:untitled/feature/profile/logic/profile_cubit.dart';
import 'package:untitled/feature/profile/logic/profile_state.dart';
import '../widgets/edit_profile/edit_profile_app_bar.dart';
import '../widgets/edit_profile/edit_profile_avatar.dart';
import '../widgets/edit_profile/edit_profile_fields.dart';
import '../widgets/edit_profile/edit_profile_save_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _nationalIdController;

  String? _imagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final profileState = context.read<ProfileCubit>().state;
    if (profileState is ProfileLoaded) {
      _nameController = TextEditingController(text: profileState.profile.name);
      _phoneController = TextEditingController(
        text: profileState.profile.phone,
      );
      _emailController = TextEditingController(
        text: profileState.profile.email,
      );
      _nationalIdController = TextEditingController(
        text: profileState.profile.nationalId,
      );
      _imagePath = profileState.profile.imagePath;
    } else {
      _nameController = TextEditingController();
      _phoneController = TextEditingController();
      _emailController = TextEditingController();
      _nationalIdController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _nationalIdController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _imagePath = pickedFile.path;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('حدث خطأ أثناء تحميل الصورة')),
        );
      }
    }
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library, color: AppTheme.primary),
              title: const Text(
                'المعرض',
                style: TextStyle(fontFamily: 'Cairo'),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: AppTheme.primary),
              title: const Text(
                'الكاميرا',
                style: TextStyle(fontFamily: 'Cairo'),
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSave() {
    final updatedProfile = ProfileFormData(
      name: _nameController.text,
      phone: _phoneController.text,
      email: _emailController.text,
      nationalId: _nationalIdController.text,
      imagePath: _imagePath,
    );
    context.read<ProfileCubit>().updateProfile(updatedProfile);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('تم الحفظ بنجاح')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          child: Column(
            children: [
              const EditProfileAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: EditProfileAvatar(
                          imagePath: _imagePath,
                          onCameraTap: _showImagePickerOptions,
                        ),
                      ),
                      const SizedBox(height: 28),
                      EditProfileFields(
                        nameController: _nameController,
                        phoneController: _phoneController,
                        emailController: _emailController,
                        nationalIdController: _nationalIdController,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
              EditProfileSaveButton(onPressed: _onSave),
            ],
          ),
        ),
      ),
    );
  }
}
