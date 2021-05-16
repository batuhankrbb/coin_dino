
import 'package:dio/dio.dart';

import 'network_option_generator.dart';

class NetworkRequestor {
  late final NetworkOptionsGenerator networkOptions;

  late Dio dio;

  NetworkRequestor({required this.networkOptions}) {
    dio = Dio();
  }

  Future<Response>? sendRequest() {
    dio.options = baseOptions();
    return dio.request(networkOptions.networkPath);
  }

  BaseOptions baseOptions() {
    return BaseOptions(
        baseUrl: networkOptions.baseURL,
        method: networkOptions.networkMethod,
        headers: networkOptions.header,
        queryParameters: networkOptions.queryParameters);
  }
}