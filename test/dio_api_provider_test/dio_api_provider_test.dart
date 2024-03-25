import 'package:flutter_test/flutter_test.dart';
import 'package:insta_demo_app/core/network_helper/dio_api_provider.dart';
import 'package:dio/dio.dart';

void main() {
  group('DioApiProvider', () {

    test('GET request should be successful', () async {
      // Arrange
      const path = 'https://jsonplaceholder.typicode.com/todos/1';

      // Act
      Response response = await DioApiProvider().get(path);

      // Assert
      expect(response.statusCode, equals(200));
      // Add more assertions based on your API response structure
    });

    test('POST request should be successful', () async {
      // Arrange
      const path = 'https://jsonplaceholder.typicode.com/posts';
      const postData = {'title': 'foo', 'body': 'bar', 'userId': 1};

      // Act
      Response response = await DioApiProvider().post(path, data: postData);

      // Assert
      expect(response.statusCode, equals(201));
      // Add more assertions based on your API response structure
    });

    test('PUT request should be successful', () async {
      // Arrange
      const path = 'https://jsonplaceholder.typicode.com/posts/1';
      const putData = {'title': 'updated title', 'body': 'updated body'};

      // Act
      Response response = await DioApiProvider().put(path, data: putData);

      // Assert
      expect(response.statusCode, equals(200));
      // Add more assertions based on your API response structure
    });

    test('DELETE request should be successful', () async {
      // Arrange
      const path = 'https://jsonplaceholder.typicode.com/posts/1';

      // Act
      Response response = await DioApiProvider().delete(path);

      // Assert
      expect(response.statusCode, equals(200));
      // Add more assertions based on your API response structure
    });
  });
}
