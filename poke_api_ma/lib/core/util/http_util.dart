import 'dart:io';

import 'package:http/http.dart';
import 'package:poke_api_ma/core/exception/network_exception.dart';

class HttpUtils {
  HttpUtils({
    required String host,
    Client? httpClient,
  })  : _httpClient = httpClient ?? Client(),
        _host = host;

  final Client _httpClient;
  final String _host;

  Future<Response> getHttp({
    required String route,
  }) async {
    Response response;

    try {
      response = await _httpClient.get(
        Uri.parse('$_host/$route'),
      );
    } on HttpException catch (e) {
      throw NetworkException(message: e.message);
    }

    return response;
  }

  Future<Response> getHttpWithQueryParams({
    required String route,
    required Map<String, dynamic>? queryParameters,
  }) async {
    Response response;

    try {
      final uri = Uri.parse('$_host/$route').replace(
        queryParameters: queryParameters,
      );

      response = await _httpClient.get(
        uri,
      );
    } on HttpException catch (e) {
      throw NetworkException(message: e.message);
    }

    return response;
  }
}
