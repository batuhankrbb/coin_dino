import 'package:coin_dino/features/market/data/data_source/contracts/i_local_market_data_source.dart';
import 'package:coin_dino/features/market/data/data_source/contracts/i_remote_market_data_source.dart';
import 'package:coin_dino/features/market/data/exception_handling/exceptions/market_exceptions.dart';
import 'package:coin_dino/features/market/data/exception_handling/market_exception_handler.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_category_entity.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/market/domain/repository_contracts/i_market_coin_repository.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';

class MarketCoinRepository extends IMarketCoinRepository {
  MarketCoinRepository(
      {required this.remoteMarketDataSource,
      required this.localeMarketDataSource,
      required this.exceptionHandler});

  final IRemoteMarketDataSource remoteMarketDataSource;
  final ILocalMarketDataSource localeMarketDataSource;
  final MarketExceptionHandler exceptionHandler;

  @override
  Future<Result<List<MarketCoinCategoryEntity>>> getAllCategories() async {
    try {
      var allCategories = await localeMarketDataSource.getAllCategories();
      var entityCategoriesList =
          allCategories.map((e) => e.toEntity()).toList();
      return Result.success(entityCategoriesList);
    } on MarketException catch (e) {
      var failure = exceptionHandler.handleException(e);
      return Result.failure(failure);
    }
  }

  @override
  Future<Result<List<MarketCoinEntity>>> getCryptoCurrencies(
      //TODO "usd" yazan yer preferencesdan alınacak
      {required MarketDate date,
      required MarketSort sort,
      MarketCoinCategoryEntity? category}) async {
    try {
      var currencies = await remoteMarketDataSource.getCryptoCurrencies(
          date.rawValue, sort.rawValue, category?.categoryID, "usd");
      var entities = currencies.map((e) => e.toEntity()).toList();
      return Result.success(entities.toList());
    } on MarketException catch (e) {
      var failure = exceptionHandler.handleException(e);
      return Result.failure(failure);
    }
  }
}
