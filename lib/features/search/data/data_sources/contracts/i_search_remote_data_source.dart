import '../../model/search_coin_model.dart';
import '../../model/search_trend_model.dart';

abstract class ISearchRemoteDataSource {
  Future<SearchTrendModel> getAllTrends();
  Future<List<SearchCoinModel>> getCoinsBySearch(String text,String vsCurrency, int page);
}
