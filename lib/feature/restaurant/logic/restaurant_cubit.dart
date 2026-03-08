import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {}

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());

  void loadRestaurantData() async {
    emit(RestaurantLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(RestaurantLoaded());
  }
}
