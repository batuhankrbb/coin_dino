import 'package:dio/dio.dart';

import '../../../../../core/constants/response_types.dart';
import '../../../../../core/network/network_clients/coin_gecko_client.dart';
import '../../../../../core/network/network_fetching/network_executer.dart';
import '../../../../../core/utils/error_printer.dart';
import '../../exception_handling/exceptions/details_exceptions.dart';
import '../../models/coin_chart_model.dart';
import '../../models/coin_detail_model.dart';
import '../contracts/i_details_remote_data_source.dart';

class DetailsRemoteDataSource implements IDetailsRemoteDataSource {
  var _executer = NetworkExecuter();

  @override
  Future<CoinChartModel> getChart(
      {required String id,
      required String days,
      required String vsCurrency,
      required String interval}) async {
    try {
      var response = await _executer.execute<CoinChartModel, CoinChartModel>(
          responseType: DefaultResponseTypes.shared.coinChart,
          options: CoinGeckoClient.marketChart(id, vsCurrency, days, interval));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper.shared.printError("DetailRemoteDataSource/getChart", e);
      throw DetailsException.chartFetchingException();
    }
  }

  @override
  Future<CoinDetailModel> getDetails({required String id}) async {
    try {
      var response = await _executer.execute<CoinDetailModel, CoinDetailModel>(
          responseType: DefaultResponseTypes.shared.coinDetail,
          options: CoinGeckoClient.details(id));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper.shared.printError("DetailRemoteDataSource/getDetails", e);
      throw DetailsException.detailsFetchingException();
    }
  }
}
