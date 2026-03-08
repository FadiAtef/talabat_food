import 'package:equatable/equatable.dart';
import '../data/models/food_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<FoodModel> recommendedFoods;
  const HomeSuccess(this.recommendedFoods);
  @override
  List<Object?> get props => [recommendedFoods];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
  @override
  List<Object?> get props => [message];
}
