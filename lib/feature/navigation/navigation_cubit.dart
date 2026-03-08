import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationTab { home, favorite, cart, track, profile }

class NavigationCubit extends Cubit<NavigationTab> {
  NavigationCubit() : super(NavigationTab.home);

  void setTab(int index) {
    if (index >= 0 && index < NavigationTab.values.length) {
      emit(NavigationTab.values[index]);
    }
  }

  void goToHome() => emit(NavigationTab.home);
  void goToFavorite() => emit(NavigationTab.favorite);
  void goToCart() => emit(NavigationTab.cart);
  void goToTrack() => emit(NavigationTab.track);
  void goToProfile() => emit(NavigationTab.profile);
}
