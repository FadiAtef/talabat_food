import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit()
    : super(
        const DetailsState(
          quantity: 1,
          selectedSize: 'سنجل',
          selectedExtras: [],
        ),
      );

  void increment() => emit(state.copyWith(quantity: state.quantity + 1));

  void decrement() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void selectSize(String size) => emit(state.copyWith(selectedSize: size));

  void toggleExtra(String extra) {
    final extras = List<String>.from(state.selectedExtras);
    if (extras.contains(extra)) {
      extras.remove(extra);
    } else {
      extras.add(extra);
    }
    emit(state.copyWith(selectedExtras: extras));
  }
}
