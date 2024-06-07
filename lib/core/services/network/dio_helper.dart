// Package imports:
import 'package:dio/dio.dart';
import 'package:full_ecommerce_app/core/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// Project imports:

class DioHelper {
  static Dio dio = Dio();

  static init() {
    // dio.interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: true,
    //     requestBody: true,
    //   ),
    // );

    dio = Dio(
      BaseOptions(
        baseUrl: apiBaseUrl,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Content-Type': 'application/json',
          // 'lang': 'en',
        },
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          responseHeader: true,
        ),
      );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    // dio.options.headers['Authorization'] = 'Bearer YOUR_TOKEN_KEY';
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> postImage({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    // String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'multipart/form-data',
      // 'lang': lang,
      'Authorization': token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    // required Map<String, dynamic> data,
    String? lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio.delete(
      url,
      queryParameters: query,
      // data: data,
    );
  }
}
