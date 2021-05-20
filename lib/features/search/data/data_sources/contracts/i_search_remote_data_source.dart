import 'package:coin_dino/features/search/data/model/search_coin_model.dart';
import 'package:coin_dino/features/search/data/model/search_trend_model.dart';

abstract class ISearchRemoteDataSource {
  Future<SearchTrendModel> getAllTrends();
  Future<List<SearchCoinModel>> getCoinsBySearch(String text);
}
