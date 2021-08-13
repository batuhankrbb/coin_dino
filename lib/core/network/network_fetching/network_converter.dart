import 'package:dio/dio.dart';

import 'base_network_model.dart';

class NetworkConverter {
  Response response;

  NetworkConverter({required this.response});

  K convertResponse<T extends BaseNetworkModel, K>(T responseType) {
    var data = response.data;
    if (data is List) {
      K convertedData =
          List<T>.from(data.map((e) => responseType.fromJson(e)).toList()) as K;
      return convertedData;
    } else {
      K convertedData = responseType.fromJson(data) as K;
      return convertedData;
    }
  }
}
