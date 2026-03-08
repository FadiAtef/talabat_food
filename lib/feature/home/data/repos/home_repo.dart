import 'package:untitled/core/networking/api_service.dart';
import '../models/food_model.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<List<FoodModel>> getRecommendedFoods() async {
    try {
      final response = await _apiService.get(
        'products',
      ); // assuming endpoint is 'products'
      if (response.statusCode == 200) {
        final List data = response.data['data'] ?? [];
        return data.map((e) => FoodModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception('Failed to load recommended foods: $e');
    }
  }
}
