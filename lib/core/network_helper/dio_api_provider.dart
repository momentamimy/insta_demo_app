
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'apis.dart';

class DioApiProvider {

  static final DioApiProvider _singleton = DioApiProvider._internal();

  static String _tokenValue = "";
  late Dio _dio;

  factory DioApiProvider() {
    return _singleton;
  }

  DioApiProvider._internal() {
    _dio = Dio();

    // Add interceptors for authentication and authorization
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        var url = options.path;

        print("$url : REQUEST : METHOD : ${options.method}");
        print("$url : REQUEST : HEADERS : ${options.headers}");
        print("$url : REQUEST : QPARAMS : ${options.queryParameters}");

        // Modify the request before it is sent
        // For example, add an authentication token to the headers
        options.headers['authorization'] = 'Bearer $_tokenValue';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        var url = response.realUri.path;
        print("$url : RESPONSE : ${response.statusCode}");
        print("$url : RESPONSE : ${response.statusMessage}");
        print("$url : RESPONSE : ${response.data ?? "null"}");
        // Handle the response, if needed
        return handler.next(response);
      },
      onError: (DioError e, handler) async {

        var url = "${e.response?.realUri.path}";
        print("$url : ERROR : ${e.error}");
        print("$url : ERROR : ${e.message}");
        print("$url : ERROR : ${e.response?.data}");
        print("$url : ERROR : ${e.response?.statusCode}");
        print("$url : ERROR : ${e.response?.statusMessage}");
        // Handle errors, such as token expiration or unauthorized access
        if (e.response?.statusCode == 401) {
          // Perform token refresh
          try {
            // Assuming refreshToken() is a function that returns a new token
            _tokenValue = await refreshToken();

            // Update the Authorization header with the new token
            if (_tokenValue.isNotEmpty) {
              e.requestOptions.headers['Authorization'] = 'Bearer $_tokenValue';
            }

            // Retry the original request with the new token
            _dio.request(e.requestOptions.path,
                options: Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers,
                ),
                data: e.requestOptions.data);
          } catch (refreshError) {
            // Handle token refresh error
            // For example, redirect to login or show an error message
            print('Token refresh failed: $refreshError');
            return handler.reject(e);
          }
        }
        return handler.next(e);
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } catch (error) {
      rethrow;
    }
  }
  Future<String> refreshToken() async {
    // Implement your token refresh logic here
    // For example, make a request to your authentication server to get a new token
    // Return the new token or throw an error if the refresh fails
    // This is a placeholder, replace it with your actual token refresh implementation
    return '';
  }
  Dio get dio => _dio;

  clearCache() {
    _dio.interceptors.clear();
  }
}
