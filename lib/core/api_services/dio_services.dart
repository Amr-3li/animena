import 'package:dio/dio.dart';

class DioServices {
  static String baseUrl = 'https://kitsu.io/api/edge/';
  static late Dio dio;
  DioServices() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
  }
  static Future<Response> getDio(String endpoint) async {
    String url = endpoint;
    final response = await dio.get(url, options: Options());
    return response;
  }

  static Future<Response> postDio(String endpoint, dynamic data) async {
    String url = endpoint;
    final response = await dio.post(url, data: data, options: Options());
    return response;
  }
}
