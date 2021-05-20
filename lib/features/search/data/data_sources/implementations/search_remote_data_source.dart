import 'package:coin_dino/core/constants/response_types.dart';
import 'package:coin_dino/core/network/network_clients/network_clients.dart';
import 'package:coin_dino/core/network/network_fetching/network_executer.dart';
import 'package:coin_dino/features/search/data/data_sources/contracts/i_search_remote_data_source.dart';
import 'package:coin_dino/features/search/data/exception_handling/exceptions/search_exception.dart';
import 'package:coin_dino/features/search/data/model/search_coin_model.dart';
import 'package:coin_dino/features/search/data/model/search_trend_model.dart';
import 'package:dio/dio.dart';

class SearchRemoteDataSource implements ISearchRemoteDataSource {
  var networkExecuter = NetworkExecuter();

  @override
  Future<SearchTrendModel> getAllTrends() async {
    try {
      var searchTrendModel =
          await networkExecuter.execute<SearchTrendModel, SearchTrendModel>(
              responseType: DefaultResponseTypes.shared.searchTrend,
              options: NetworkClients.searchTrends());
      if (searchTrendModel == null) {
        throw DioError(requestOptions: RequestOptions(path: "path"));
      }
      return searchTrendModel;
    } on DioError catch (e) {
      throw SearchException.trendsFetchingException();
    }
  }

  @override
  Future<List<SearchCoinModel>> getCoinsBySearch(String text, String vsCurrency) async {
    try {
      var getCoinBySearchs =
          await networkExecuter.execute<SearchCoinModel, List<SearchCoinModel>>(
              responseType: DefaultResponseTypes.shared.searchCoing,
              options: NetworkClients.getCoinSearchClient(text,vsCurrency));
      if (getCoinBySearchs != null) {
        return getCoinBySearchs;
      } else {
        throw DioError(requestOptions: RequestOptions(path: "path"));
      }
    } on DioError catch (e) {
      throw SearchException.getCoinsBySearchException();
    }
  }
}
