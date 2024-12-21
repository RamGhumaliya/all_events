import 'package:all_events/core/utils/api_end_points.dart';
import 'package:dio/dio.dart';

import '../error/api_exception.dart';

/// A custom API client class that provides methods to interact with REST APIs.
class ApiClient {
  late final Dio _dio;

  /// Constructor to initialize Dio with default options.
  ApiClient({BaseOptions? options}) {
    _dio = Dio(
      options ??
          BaseOptions(
            baseUrl: ApiEndPoints.baseUrl, // Set default base URL if required
            connectTimeout: const Duration(seconds: 60), // Connection timeout
            receiveTimeout: const Duration(seconds: 60), // Response timeout
          ),
    );

    // Add interceptors for logging and error handling
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  /// Perform a GET request.
  ///
  /// [path] is the endpoint to call.
  /// [queryParameters] are optional parameters to include in the URL.
  /// [headers] are optional custom headers.
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Perform a POST request.
  ///
  /// [path] is the endpoint to call.
  /// [data] is the request payload.
  /// [headers] are optional custom headers.
  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Perform a PUT request.
  ///
  /// [path] is the endpoint to call.
  /// [data] is the request payload.
  /// [headers] are optional custom headers.
  Future<Response> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Perform a DELETE request.
  ///
  /// [path] is the endpoint to call.
  /// [headers] are optional custom headers.
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle Dio errors and convert them to readable messages.
  ///
  /// [dioError] is the error object from Dio.
  ApiException _handleError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException('Connection timeout, please try again.');
      case DioExceptionType.receiveTimeout:
        return ApiException('Response timeout, please try again.');
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode;
        final message = dioError.response?.data['message'] ?? 'Unknown error';
        return ApiException('Error [$statusCode]: $message',
            statusCode: statusCode);
      case DioExceptionType.cancel:
        return ApiException('Request cancelled.');
      case DioExceptionType.unknown:
        return ApiException(
            'An unexpected error occurred: ${dioError.message}');
      default:
        return ApiException('An unknown error occurred.');
    }
  }
}
