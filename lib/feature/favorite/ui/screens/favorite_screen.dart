import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/favorite/logic/favorite_cubit.dart';
import 'package:untitled/feature/favorite/ui/widgets/favorite_item_widget.dart';
import 'package:untitled/feature/navigation/navigation_cubit.dart';
import 'package:untitled/feature/cart/logic/cart_cubit.dart';
import 'package:untitled/feature/cart/data/models/cart_item.dart';
import 'package:untitled/widget/custom_app_bar_app.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Header using the shared reusable custom app bar
            const CustomAppBarApp(title: 'المفضلة'),
            const SizedBox(height: 20),

            // Favorites List
            Expanded(
              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  if (state is FavoriteLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is FavoriteLoaded) {
                    if (state.favorites.isEmpty) {
                      return const Center(child: Text('قائمة المفضلات فارغة'));
                    }
                    return ListView.builder(
                      itemCount: state.favorites.length,
                      padding: const EdgeInsets.only(bottom: 100),
                      itemBuilder: (context, index) {
                        final food = state.favorites[index];
                        return FavoriteItemWidget(
                          food: food,
                          onToggleFavorite: () => context
                              .read<FavoriteCubit>()
                              .toggleFavorite(food),
                          onAddToCart: () {
                            context.read<CartCubit>().addToCart(
                              CartItem(
                                food: food,
                                quantity: 1,
                                selectedSize: 'S',
                                selectedExtras: [],
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تمت الإضافة للسلة'),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
