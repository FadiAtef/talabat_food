import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to fetch data: ${e.message}');
    }
  }
}
