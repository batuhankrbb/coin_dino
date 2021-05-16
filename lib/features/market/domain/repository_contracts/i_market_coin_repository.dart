import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_category_entity.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';

abstract class IMarketCoinRepository {
  Future<Result<List<MarketCoinEntity>>> getCryptoCurrencies(
      {required MarketDate date,
      required MarketSort sort,
      MarketCoinCategoryEntity? category});
      
  Future<Result<List<MarketCoinCategoryEntity>>> getAllCategories();
}

enum MarketDate { hour1, hour24, day1, day7, day30 }

enum MarketSort {
  market_cap_desc,
  gecko_desc,
  gecko_asc,
  market_cap_asc,
  volume_asc,
  volume_desc,
  id_asc,
  id_desc
}
