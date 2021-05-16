import 'package:coin_dino/core/network/network_clients/network_clients.dart';
import 'package:coin_dino/core/network/network_fetching/network_executer.dart';
import 'package:coin_dino/core/utils/error_printer.dart';
import 'package:coin_dino/features/details/data/data_source/data_contracts/i_details_remote_data_source.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/features/details/data/models/coins_chart_model.dart';
import 'package:dio/dio.dart';

class DetailsRemoteDataSource implements IDetailsRemoteDataSource {
  var _exevuter = NetworkExecuter();

  @override
  Future<CoinChartModel> getChart(
      String id, String days, String vsCurrency, String interval) async {
    try {
      var response = await _exevuter.execute<CoinChartModel, CoinChartModel>(
          responseType: CoinChartModel(prices: [
            [0.0]
          ], marketCaps: [
            [0.0]
          ], totalVolumes: [
            [0.0]
          ]),
          options: NetworkClients.martketChart(id, vsCurrency, days, interval));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "ActivityRemoteDataSourceImplementation/getActivityByType", e);
      /// TODO : BU ALAN DEĞİŞECEK UNUTMA AMK
      throw "$e";
    }
  }

  @override
  Future<CoinDetailEntity> getDetails(String id) async {
    try {
      var response =
          await _exevuter.execute<CoinDetailEntity, CoinDetailEntity>(
              responseType: CoinDetailEntity(
                  additionalNotices: [""],
                  assetPlatformId: 1,
                  blockTimeInMinutes: 1,
                  categories: [""],
                  description: "",
                  hashingAlgorithm: "",
                  id: "",
                  name: "",
                  publicNotice: "",
                  symbol: ""),
              options: NetworkClients.coinsID(id));
      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "ActivityRemoteDataSourceImplementation/getRandomActivity", e);
      throw "${e.response?.statusCode}";
    }
  }
}
