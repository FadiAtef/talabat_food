import 'package:equatable/equatable.dart';

class DetailsState extends Equatable {
  final int quantity;
  final String selectedSize;
  final List<String> selectedExtras;

  const DetailsState({
    required this.quantity,
    required this.selectedSize,
    required this.selectedExtras,
  });

  DetailsState copyWith({
    int? quantity,
    String? selectedSize,
    List<String>? selectedExtras,
  }) {
    return DetailsState(
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedExtras: selectedExtras ?? this.selectedExtras,
    );
  }

  @override
  List<Object?> get props => [quantity, selectedSize, selectedExtras];
}
