import 'package:coin_dino/features/market/data/data_source/contracts/i_remote_market_data_source.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_category_entity.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/market/domain/repository_contracts/i_market_coin_repository.dart';

class MarketCoinRepository extends IMarketCoinRepository {
  MarketCoinRepository({required this.remoteMarketDataSource});

  final IRemoteMarketDataSource remoteMarketDataSource;

  @override
  Future<Result<List<MarketCoinCategoryEntity>>> getAllCategories() async {
    try {
      var allCategories = await remoteMarketDataSource.getAllCategories();
      var entityCategoriesList =
          allCategories.map((e) => e.toEntity()).toList();
      return Result.success(entityCategoriesList);
    } catch (e) {}
    throw UnimplementedError();
  }

  @override
  Future<Result<List<MarketCoinEntity>>> getCryptoCurrencies(
      {required MarketDate date,
      required MarketSort sort,
      MarketCoinCategoryEntity? category}) async {
        
    // TODO: implement getCryptoCurrencies
    throw UnimplementedError();
  }
}
