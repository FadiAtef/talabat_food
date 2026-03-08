import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> getRecommendedFoods() async {
    emit(HomeLoading());
    try {
      final foods = await _homeRepo.getRecommendedFoods();
      emit(HomeSuccess(foods));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
