import 'package:ass_simple_ecommorce/core/api/dio_interceptor.dart';
import 'package:ass_simple_ecommorce/core/api/isolate_parser.dart';
import 'package:ass_simple_ecommorce/core/error/failure.dart';
import 'package:ass_simple_ecommorce/core/helper/get_storage_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient {
  String baseUrl = const String.fromEnvironment("BASE_URL");

  String? _auth;
  bool _isUnitTest = false;
  late Dio _dio;

  DioClient({bool isUnitTest = false}) {
    _isUnitTest = isUnitTest;

    // Retrieve authentication token if available
    try {
      _auth = box.read('token');
    } catch (_) {}

    // Initialize Dio instance
    _dio = _createDio();

    // Add interceptor unless running unit tests
    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  /// Returns a Dio instance, recreating it when necessary to refresh token
  Dio get dio {
    if (_isUnitTest) {
      return _dio; // Return static instance for unit tests
    } else {
      // Refresh token if needed for non-unit test environments
      try {
        _auth = box.read('token');
      } catch (_) {}

      final dio = _createDio();

      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());

      return dio;
    }
  }

  /// Creates a Dio instance with base configuration
  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) 'Authorization': "Bearer $_auth",
          },
          receiveTimeout: const Duration(minutes: 1),
          connectTimeout: const Duration(minutes: 1),
          validateStatus: (int? status) {
            return status! > 0; // Accept any positive HTTP status code
          },
        ),
      );

  /// Generic GET request that supports parsing JSON responses as List or Map
  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ResponseConverter<T> converter,
    bool isIsolate = true,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);

      // Validate the HTTP status code
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      final responseData = response.data;

      // Handle response data as either a List or Map
      if (!isIsolate || responseData is List) {
        // Directly convert if we're not using isolate or if the data is a List
        return Right(converter(responseData));
      } else if (responseData is Map<String, dynamic>) {
        // Use IsolateParser for Map data in background if isIsolate is true
        final isolateParse = IsolateParser<T>(responseData, converter);
        final result = await isolateParse.parseInBackground();
        return Right(result);
      } else {
        throw Exception("Unsupported response format for Isolate parsing");
      }
    } on DioException catch (e) {
      return Left(
          ServerFailure(e.response?.data['message'] as String? ?? e.message));
    }
  }
}
