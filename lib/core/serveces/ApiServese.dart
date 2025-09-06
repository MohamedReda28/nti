import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServese {
  final Dio _dio;
  ApiServese(this._dio);

  final String _baseUrl = 'https://fakestoreapi.com/';

  Future<dynamic> get(
      {required String endPoint, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: headers));

    return response.data;
  }

  Future<dynamic> post(
      {required String endPoint,
        @required String? token,
        Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.post('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }

  
  Future<dynamic> put(
      {required String endPoint,
      @required String? token,
      Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.put('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }

  Future<dynamic> patch(
      {required String endPoint,
      @required String? token,
      Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.patch('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }

  Future<dynamic> delete(
      {required String endPoint,
      @required String? token,
      Map<String, dynamic>? body}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    var response = await _dio.delete('$_baseUrl$endPoint',
        data: body, options: Options(headers: headers));

    return response.data;
  }
}

// class ApiServese {
//   final Dio _dio;
//   ApiServese(this._dio);
//
//   final String _baseUrl = 'https://fakestoreapi.com/';
//
//   Future<dynamic> get(
//       {required String endPoint, @required String? token}) async {
//     Map<String, String> headers = {};
//     if (token != null) {
//       headers.addAll({
//         'Authroization': 'Bearer $token',
//       });
//     }
//     var response = await _dio.get('$_baseUrl$endPoint',
//       options: Options(headers: headers),);
//
//     return response.data;
//   }
// }
