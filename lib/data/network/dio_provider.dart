import 'package:dio/dio.dart';

import '../../configs/config.dart';
import '../../domain/domain.dart';
import 'logging_interceptor.dart';

class DioProvider {
  
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.baseUrl,
      validateStatus:(status) {
        return true;
      },
    )
  );

  DioProvider() {
    _dio.interceptors.add(LoggingInterceptor());
  } 

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response.data;
    } catch (error) {
      throw _handleError(error as Exception);
    }
  }

  Future<dynamic> post(
    String endpoint, 
    Map<String, dynamic> data
  ) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      if (response.statusCode != null && response.statusCode! >= 400) {
        throw ApiFailureException(response.statusCode, response.data);
      }
      return response.data;
    } catch (error) {
      throw _handleError(error as Exception);
    }
  }

  Exception _handleError(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return NetworkException();
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.badResponse:
        case DioExceptionType.badCertificate:
          return ApiFailureException(error.response?.statusCode ?? -1, error.message ?? 'Not found Error');
        default:
          return UnknownFailureException();
      }
    }
    return error;
  }
}