import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';
import 'dart:developer' as developer;

class ApiService {
  late Dio _dio;
  static const String _tokenKey = 'auth_token';

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Add logging interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        developer.log(
          'API Request:',
          name: 'ApiService',
          error: '''
URL: ${options.uri}
Method: ${options.method}
Headers: ${options.headers}
Data: ${options.data}''',
        );
        
        final token = await getAuthToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        developer.log(
          'API Response:',
          name: 'ApiService',
          error: '''
URL: ${response.requestOptions.uri}
Status: ${response.statusCode}
Data: ${response.data}''',
        );
        handler.next(response);
      },
      onError: (error, handler) {
        developer.log(
          'API Error:',
          name: 'ApiService',
          error: '''
URL: ${error.requestOptions.uri}
Status: ${error.response?.statusCode}
Error: ${error.message}
Response Data: ${error.response?.data}
Type: ${error.type}
Error: ${error.error}''',
        );
        
        if (error.response?.statusCode == 401) {
          clearAuthToken();
        }
        handler.next(error);
      },
    ));
  }

  // Auth token management
  Future<void> saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> clearAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAuthToken();
    return token != null;
  }

  // API Endpoints
  Future<Map<String, dynamic>> signup({
    required String email,
    required String username,
    required String password,
    String? fullName,
  }) async {
    try {
      developer.log(
        'Attempting signup',
        name: 'ApiService',
        error: 'Email: $email, Username: $username',
      );

      final response = await _dio.post(
        '/api/v1/auth/signup',  // Fixed path to match backend exactly
        data: {
          'email': email,
          'username': username,
          'password': password,
          if (fullName != null) 'full_name': fullName,
        },
      );

      if (response.data['access_token'] != null) {
        await saveAuthToken(response.data['access_token']);
      }

      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      developer.log(
        'Attempting login',
        name: 'ApiService',
        error: 'Email: $email',
      );

      final response = await _dio.post(
        '/api/v1/auth/token',  // Fixed path to match backend exactly
        data: {
          'username': email,  // FastAPI OAuth2 expects 'username'
          'password': password,
        },
        options: Options(
          contentType: 'application/x-www-form-urlencoded',  // Required for OAuth2
        ),
      );

      if (response.data['access_token'] != null) {
        await saveAuthToken(response.data['access_token']);
      }

      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      final response = await _dio.get('/api/v1/auth/me');  // Fixed path to match backend exactly
      return response.data;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> logout() async {
    await clearAuthToken();
  }

  // Error handling
  String _handleDioError(DioException e) {
    developer.log(
      'Handling DioError',
      name: 'ApiService',
      error: '''
Type: ${e.type}
Message: ${e.message}
Response: ${e.response?.data}''',
    );

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return 'Connection timeout. Please check your internet connection.';
    }

    if (e.type == DioExceptionType.connectionError) {
      return 'Cannot connect to server. Please check your internet connection.';
    }

    if (e.response != null) {
      final data = e.response!.data;
      if (data is Map<String, dynamic>) {
        if (data.containsKey('detail')) {
          return data['detail'].toString();
        }
        if (data.containsKey('message')) {
          return data['message'].toString();
        }
      }
      return 'Server error: ${e.response!.statusCode}';
    }

    return 'Network error: ${e.message}';
  }
}

// Singleton instance
final apiService = ApiService();