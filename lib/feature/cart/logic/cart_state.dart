import 'package:equatable/equatable.dart';
import 'package:untitled/feature/cart/data/models/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final double deliveryFee;

  const CartState({this.items = const [], this.deliveryFee = 15.0});

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  double get total => subtotal + deliveryFee;

  CartState copyWith({List<CartItem>? items, double? deliveryFee}) {
    return CartState(
      items: items ?? this.items,
      deliveryFee: deliveryFee ?? this.deliveryFee,
    );
  }

  @override
  List<Object?> get props => [items, deliveryFee];
}
