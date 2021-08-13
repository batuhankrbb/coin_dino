import 'package:coin_dino/features/market/data/models/market_coin_category.model.dart';

import '../../../../core/result_types/result.dart';
import '../../../preferences/data/contracts/i_preferences_local_data_source.dart';
import '../../domain/entities/market_coin_category_entity.dart';
import '../../domain/entities/market_coin_entity.dart';
import '../../domain/repository_contracts/i_market_coin_repository.dart';
import '../../presentation/utils/listing_enums.dart';
import '../data_source/contracts/i_market_remote_data_source.dart';
import '../exception_handling/exceptions/market_exceptions.dart';
import '../exception_handling/market_exception_handler.dart';

class MarketCoinRepository extends IMarketCoinRepository {
  MarketCoinRepository(
      {required this.marketRemoteDataSource,
      required this.preferencesLocalDataSource,
      required this.exceptionHandler});

  final IMarketRemoteDataSource marketRemoteDataSource;
  final IPreferencesLocalDataSource preferencesLocalDataSource;
  final MarketExceptionHandler exceptionHandler;

  @override
  Future<Result<List<MarketCoinCategoryEntity>>> getAllCategories() async {
    try {
      var allCategories = await marketRemoteDataSource.getAllCategories();
      allCategories.insert(
          0, MarketCoinCategoryModel(categoryId: "all", name: "All"));
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
      {required MarketDate date,
      required MarketSort sort,
      required int page,
      MarketCoinCategoryEntity? category}) async {
    try {
      var basecurrency = await getBaseCurrency();
      var currencies = await marketRemoteDataSource.getCryptoCurrencies(
          date.rawValue,
          sort.rawValue,
          category?.categoryID,
          basecurrency,
          page);
      var entities = currencies.map((e) => e.toEntity()).toList();
      return Result.success(entities.toList());
    } on MarketException catch (e) {
      var failure = exceptionHandler.handleException(e);
      return Result.failure(failure);
    }
  }

  Future<String> getBaseCurrency() async {
    try {
      var baseCurrency =
          await preferencesLocalDataSource.getBaseCurrencyPreference();
      return baseCurrency;
    } catch (e) {
      return "usd";
    }
  }
}
