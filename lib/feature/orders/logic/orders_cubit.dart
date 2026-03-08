import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/core/app_assets.dart';
import 'package:untitled/feature/orders/data/models/order_model.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
  @override
  List<Object?> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderModel> orders;
  const OrdersLoaded(this.orders);
  @override
  List<Object?> get props => [orders];
}

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void loadOrders() async {
    emit(OrdersLoading());
    await Future.delayed(const Duration(milliseconds: 700));
    final dummyOrders = [
      OrderModel(
        orderId: '4528',
        date: 'Nov 2023 16:48:23',
        status: 'قيد التنفيذ',
        image: AppAssets.cartImage1,
      ),
      OrderModel(
        orderId: '4529',
        date: 'Nov 2023 18:30:00',
        status: 'تم التسليم',
        image: AppAssets.cartImage2,
      ),
    ];
    emit(OrdersLoaded(dummyOrders));
  }
}
