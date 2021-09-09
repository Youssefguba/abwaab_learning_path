import 'package:dio/dio.dart';

class NetworkHelper {
  static NetworkHelper? _instance;
  static Dio? _dio;

  NetworkHelper._internal();

  factory NetworkHelper() {
    if (_instance == null) {
      _dio = Dio();
      _dio?.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
      _instance = NetworkHelper._internal();
    }
    return _instance!;
  }


  /// get method execute _dio.get method.
  Future<Response> get(
    String url, {
    Map<String, dynamic>? headers,
  }) async {
    Response _res;
    if (headers != null) {
      _dio?.options.headers = headers;
    } else {
      _dio?.options.headers = {'Accept': 'application/json'};
    }
    try {
      _res = (await _dio?.get(url))!;
    } on DioError catch (e) {
      _res = e.response!;
    }
    return _res;
  }
}
