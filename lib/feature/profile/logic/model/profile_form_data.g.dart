// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_form_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileFormDataAdapter extends TypeAdapter<ProfileFormData> {
  @override
  final int typeId = 1;

  @override
  ProfileFormData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileFormData(
      name: fields[0] as String,
      phone: fields[1] as String,
      email: fields[2] as String,
      nationalId: fields[3] as String,
      imagePath: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileFormData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.nationalId)
      ..writeByte(4)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileFormDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
