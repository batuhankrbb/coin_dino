import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/features/search/domain/entity/search_trend_entity.dart';

abstract class ISearchRepository {
  Future<Result<SearchTrendEntity>> getAllTrends();
  Future<Result<List<SearchCoinEntity>>> getCoinsBySearch(String text);
}
