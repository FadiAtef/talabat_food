import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class FoodModel {
  @JsonKey(name: '_id')
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final dynamic price;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final String? category;

  FoodModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}
