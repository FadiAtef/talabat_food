import 'package:hive/hive.dart';

part 'profile_form_data.g.dart';

@HiveType(typeId: 1)
class ProfileFormData extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String email;
  @HiveField(3)
  String nationalId;
  @HiveField(4)
  String? imagePath;

  ProfileFormData({
    required this.name,
    required this.phone,
    required this.email,
    required this.nationalId,
    this.imagePath,
  });
}
