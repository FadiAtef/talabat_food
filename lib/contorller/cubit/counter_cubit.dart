import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial());

  void increment() {
    emit(CounterUpdate(count: state.count + 1));
  }

  void decrement() {
    if (state.count > 1) {
      emit(CounterUpdate(count: state.count - 1));
    }
  }
}
