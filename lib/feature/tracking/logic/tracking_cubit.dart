import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class TrackingState extends Equatable {
  const TrackingState();
  @override
  List<Object?> get props => [];
}

class TrackingInitial extends TrackingState {}

class TrackingLoading extends TrackingState {}

class TrackingLoaded extends TrackingState {
  final int minutesLeft;
  const TrackingLoaded(this.minutesLeft);
  @override
  List<Object?> get props => [minutesLeft];
}

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(TrackingInitial());

  void trackOrder() async {
    emit(TrackingLoading());
    // Simulate initial loading
    await Future.delayed(const Duration(seconds: 1));
    emit(const TrackingLoaded(15));
  }
}
