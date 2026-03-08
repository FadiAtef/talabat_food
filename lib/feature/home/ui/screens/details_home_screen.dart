import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/home/logic/details_cubit.dart';
import 'package:untitled/feature/home/logic/details_state.dart';
import 'package:untitled/feature/home/data/models/food_model.dart';
import '../widgets/details/details_header.dart';
import '../widgets/details/details_actions.dart';
import '../widgets/details/details_info.dart';
import '../widgets/details/details_options.dart';
import '../widgets/details/details_bottom_bar.dart';

class DetailsHomeScreen extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final String description;
  final FoodModel food;

  const DetailsHomeScreen({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailsHeader(image: image),
                          const SizedBox(height: 16),
                          DetailsInfo(
                            name: name,
                            description: description,
                            price: price,
                            quantity: state.quantity,
                          ),
                          DetailsOptions(
                            selectedSize: state.selectedSize,
                            selectedExtras: state.selectedExtras,
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  ),
                  const DetailsActions(),
                  DetailsBottomBar(
                    price: price,
                    quantity: state.quantity,
                    food: food,
                    selectedSize: state.selectedSize,
                    selectedExtras: state.selectedExtras,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
