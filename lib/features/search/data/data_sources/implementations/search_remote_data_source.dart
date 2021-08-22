import '../../../../../core/utils/error_printer.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/response_types.dart';
import '../../../../../core/network/network_clients/coin_gecko_client.dart';
import '../../../../../core/network/network_fetching/network_executer.dart';
import '../../exception_handling/exceptions/search_exception.dart';
import '../../model/search_coin_model.dart';
import '../../model/search_trend_model.dart';
import '../contracts/i_search_remote_data_source.dart';

class SearchRemoteDataSource implements ISearchRemoteDataSource {
  var _networkExecuter = NetworkExecuter();

  @override
  Future<SearchTrendModel> getAllTrends() async {
    try {
      var searchTrendModel =
          await _networkExecuter.execute<SearchTrendModel, SearchTrendModel>(
              responseType: DefaultResponseTypes.shared.searchTrend,
              options: CoinGeckoClient.searchTrends());
      if (searchTrendModel == null) {
        throw DioError(requestOptions: RequestOptions(path: "path"));
      }
      return searchTrendModel;
    } on DioError catch (e) {
        ErrorHelper.shared.printError("SearchRemoteDataSource/getAllTrends", e);
      throw SearchException.trendsFetchingException();
    }
  }

  @override
  Future<List<SearchCoinModel>> getCoinsBySearch(
      String text, String vsCurrency, int page) async {
    try {
      var getCoinBySearchs =
          await _networkExecuter.execute<SearchCoinModel, List<SearchCoinModel>>(
              responseType: DefaultResponseTypes.shared.searchCoing,
              options: CoinGeckoClient.coinSearch(text, vsCurrency,page));
      if (getCoinBySearchs != null) {
        var filteredCoins = getCoinBySearchs.where((element) {
          return element.name.toLowerCase().startsWith(text.toLowerCase());
        }).toList();
        return filteredCoins;
      } else {
        throw DioError(requestOptions: RequestOptions(path: "path"));
      }
    } on DioError catch (e) {
         ErrorHelper.shared.printError("SearchRemoteDataSource/getCoinsBySearch", e);
      throw SearchException.getCoinsBySearchException();
    }
  }
}
