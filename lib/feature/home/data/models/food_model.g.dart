// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodModelAdapter extends TypeAdapter<FoodModel> {
  @override
  final int typeId = 0;

  @override
  FoodModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      price: fields[3] as dynamic,
      image: fields[4] as String?,
      category: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FoodModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'],
      image: json['image'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'category': instance.category,
    };
