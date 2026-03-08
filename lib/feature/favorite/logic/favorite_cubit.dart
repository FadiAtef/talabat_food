import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/feature/home/data/models/food_model.dart';
import 'package:untitled/core/app_assets.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object?> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FoodModel> favorites;
  const FavoriteLoaded(this.favorites);
  @override
  List<Object?> get props => [favorites];
}

class FavoriteCubit extends Cubit<FavoriteState> {
  final Box<FoodModel> _box = Hive.box<FoodModel>('favorites');

  FavoriteCubit() : super(FavoriteInitial());

  void loadFavorites() {
    emit(FavoriteLoading());

    List<FoodModel> favorites = _box.values.toList();

    // If empty, provide mock data as per user's image request
    if (favorites.isEmpty) {
      favorites = [
        FoodModel(
          id: 'mock_1',
          name: 'اسم الوجبة هنا',
          category: 'اسم المطعم',
          price: 250,
          image: AppAssets.best1,
        ),
        FoodModel(
          id: 'mock_2',
          name: 'اسم الوجبة هنا',
          category: 'اسم المطعم',
          price: 250,
          image: AppAssets.best3,
        ),
        FoodModel(
          id: 'mock_3',
          name: 'اسم الوجبة هنا',
          category: 'اسم المطعم',
          price: 250,
          image: AppAssets.best4,
        ),
      ];
    }

    emit(FavoriteLoaded(favorites));
  }

  void toggleFavorite(FoodModel food) {
    if (isFavorite(food)) {
      _box.delete(food.id);
    } else {
      _box.put(food.id, food);
    }
    loadFavorites();
  }

  bool isFavorite(FoodModel food) {
    return _box.containsKey(food.id);
  }
}
