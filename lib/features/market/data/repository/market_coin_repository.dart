import '../../../../core/result_types/result.dart';
import '../../domain/entities/market_coin_category_entity.dart';
import '../../domain/entities/market_coin_entity.dart';
import '../../domain/repository_contracts/i_market_coin_repository.dart';
import '../../presentation/utils/listing_enums.dart';
import '../data_source/contracts/i_market_local_data_source.dart';
import '../data_source/contracts/i_market_remote_data_source.dart';
import '../exception_handling/exceptions/market_exceptions.dart';
import '../exception_handling/market_exception_handler.dart';

class MarketCoinRepository extends IMarketCoinRepository {
  MarketCoinRepository(
      {required this.MarketRemoteDataSource,
      required this.localeMarketDataSource,
      required this.exceptionHandler});

  final IMarketRemoteDataSource MarketRemoteDataSource;
  final IMarketLocalDataSource localeMarketDataSource;
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
      var currencies = await MarketRemoteDataSource.getCryptoCurrencies(
          date.rawValue, sort.rawValue, category?.categoryID, "usd");
      var entities = currencies.map((e) => e.toEntity()).toList();
      return Result.success(entities.toList());
    } on MarketException catch (e) {
      var failure = exceptionHandler.handleException(e);
      return Result.failure(failure);
    }
  }
}
