import '../../../../core/result_types/result.dart';
import '../entity/search_coin_entity.dart';
import '../entity/search_trend_entity.dart';

abstract class ISearchRepository {
  Future<Result<SearchTrendEntity>> getAllTrends();
  Future<Result<List<SearchCoinEntity>>> getCoinsBySearch(String text, int page);
}
