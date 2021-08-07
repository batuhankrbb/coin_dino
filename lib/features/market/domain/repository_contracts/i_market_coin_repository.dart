import '../../../../core/result_types/result.dart';
import '../../presentation/utils/listing_enums.dart';
import '../entities/market_coin_category_entity.dart';
import '../entities/market_coin_entity.dart';

abstract class IMarketCoinRepository {
  Future<Result<List<MarketCoinEntity>>> getCryptoCurrencies(
      {required MarketDate date,
      required MarketSort sort,
      required int page,
      MarketCoinCategoryEntity? category});

  Future<Result<List<MarketCoinCategoryEntity>>> getAllCategories();
}
