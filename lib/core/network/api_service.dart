import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final query = queryParameters ?? {};
    query['apiKey'] = ApiConstants.apiKey;

    final response = await _dio.get(endPoint, queryParameters: query);
    return response.data;
  }
}
