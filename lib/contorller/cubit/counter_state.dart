part of 'counter_cubit.dart';

@immutable
sealed class CounterState {
  final double count;
  final double itemPrice;
  final double deliveryFee;

  const CounterState({
    required this.count,
    this.itemPrice = 2.20,
    this.deliveryFee = 0.30,
  });

  double get subtotal => count * itemPrice;
  double get total => subtotal + deliveryFee;
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(count: 1);
}

final class CounterUpdate extends CounterState {
  const CounterUpdate({required super.count});
}
