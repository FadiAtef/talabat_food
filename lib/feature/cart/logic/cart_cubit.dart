import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/cart/data/models/cart_item.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart(CartItem item) {
    final updatedItems = List<CartItem>.from(state.items)..add(item);
    emit(state.copyWith(items: updatedItems));
  }

  void removeFromCart(int index) {
    final updatedItems = List<CartItem>.from(state.items)..removeAt(index);
    emit(state.copyWith(items: updatedItems));
  }

  void clearCart() {
    emit(state.copyWith(items: []));
  }
}
