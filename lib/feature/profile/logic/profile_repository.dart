import 'package:hive_flutter/hive_flutter.dart';
import 'model/profile_form_data.dart';

class ProfileRepository {
  static const String _boxName = 'user_box';
  static const String _userKey = 'user_profile';

  Future<void> init() async {
    // Registry and box opening handled in main.dart
    // Ensure box is open
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<ProfileFormData>(_boxName);
    }
  }

  Future<void> saveProfile(ProfileFormData profile) async {
    final box = Hive.box<ProfileFormData>(_boxName);
    await box.put(_userKey, profile);
  }

  ProfileFormData? getProfile() {
    final box = Hive.box<ProfileFormData>(_boxName);
    return box.get(_userKey);
  }
}
