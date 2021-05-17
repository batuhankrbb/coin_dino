import 'package:coin_dino/core/constants/response_types.dart';
import 'package:coin_dino/core/network/network_clients/network_clients.dart';
import 'package:coin_dino/core/network/network_fetching/network_executer.dart';
import 'package:coin_dino/core/utils/error_printer.dart';
import 'package:coin_dino/features/details/data/data_source/data_contracts/i_details_remote_data_source.dart';
import 'package:coin_dino/features/details/data/exception_handling/exceptions/details_exceptions.dart';
import 'package:coin_dino/features/details/data/models/coin_detail_model.dart';
import 'package:coin_dino/features/details/data/models/coin_chart_model.dart';
import 'package:dio/dio.dart';

class DetailsRemoteDataSource implements IDetailsRemoteDataSource {
  var _executer = NetworkExecuter();

  @override
  Future<CoinChartModel> getChart(
      {required String id, required String days, required String vsCurrency, required String interval}) async {
    try {
      var response = await _executer.execute<CoinChartModel, CoinChartModel>(
          responseType: DefaultResponseTypes.shared.coinChart,
          options: NetworkClients.martketChart(id, vsCurrency, days, interval));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "DetailRemoteDataSource/getChart", e);
        throw DetailsException.chartFetchingException(); 
    }
  }

  @override
  Future<CoinDetailModel> getDetails({required String id}) async {
    try {
      var response =
          await _executer.execute<CoinDetailModel, CoinDetailModel>(
              responseType: DefaultResponseTypes.shared.coinDetail,
              options: NetworkClients.coinsID(id));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "DetailRemoteDataSource/getDetails", e);
       throw DetailsException.detailsFetchingException();
    }
  }
}
