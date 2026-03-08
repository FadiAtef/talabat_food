import 'package:flutter/material.dart';
import 'package:untitled/core/app_theme.dart';
import 'package:untitled/home_screen.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/feature/profile/logic/profile_cubit.dart';
import 'package:untitled/feature/profile/logic/profile_repository.dart';
import 'package:untitled/feature/profile/logic/model/profile_form_data.dart';
import 'package:untitled/feature/navigation/navigation_cubit.dart';
import 'package:untitled/feature/home/logic/home_cubit.dart';
import 'package:untitled/feature/cart/logic/cart_cubit.dart';
import 'package:untitled/feature/favorite/logic/favorite_cubit.dart';
import 'package:untitled/feature/tracking/logic/tracking_cubit.dart';
import 'package:untitled/feature/orders/logic/orders_cubit.dart';
import 'package:untitled/core/networking/api_service.dart';
import 'package:untitled/feature/home/data/repos/home_repo.dart';
import 'package:untitled/feature/restaurant/logic/restaurant_cubit.dart';
import 'package:untitled/feature/home/data/models/food_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register Hive adapters
  if (!Hive.isAdapterRegistered(0)) Hive.registerAdapter(FoodModelAdapter());
  if (!Hive.isAdapterRegistered(1))
    Hive.registerAdapter(ProfileFormDataAdapter());

  await Hive.openBox<FoodModel>('favorites');
  await Hive.openBox<ProfileFormData>('user_box');

  final profileRepository = ProfileRepository();
  final apiService = ApiService();
  final homeRepo = HomeRepo(apiService);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: profileRepository),
        RepositoryProvider.value(value: homeRepo),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavigationCubit()),
          BlocProvider(
            create: (_) => HomeCubit(homeRepo)..getRecommendedFoods(),
          ),
          BlocProvider(create: (_) => CartCubit()),
          BlocProvider(create: (_) => FavoriteCubit()..loadFavorites()),
          BlocProvider(create: (_) => TrackingCubit()..trackOrder()),
          BlocProvider(create: (_) => OrdersCubit()..loadOrders()),
          BlocProvider(create: (_) => RestaurantCubit()..loadRestaurantData()),
          BlocProvider(
            create: (_) => ProfileCubit(profileRepository)..loadProfile(),
          ),
        ],
        child: const FoodDeliveryApp(),
      ),
    ),
  );
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'SA'),
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
