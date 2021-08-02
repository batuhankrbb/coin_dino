import '../../../../core/result_types/result.dart';
import '../../domain/entity/search_coin_entity.dart';
import '../../domain/entity/search_trend_entity.dart';
import '../../domain/repository_contract/i_search_repository.dart';
import '../data_sources/contracts/i_search_remote_data_source.dart';
import '../exception_handling/exception_handler.dart';
import '../exception_handling/exceptions/search_exception.dart';

class SearchRepository extends ISearchRepository {
  final ISearchRemoteDataSource remoteDataSource;
  final SearchExceptionHandler exceptionHandler;

  SearchRepository(
      {required this.remoteDataSource, required this.exceptionHandler});

  @override
  Future<Result<SearchTrendEntity>> getAllTrends() async {
    try {
      var trends = await remoteDataSource.getAllTrends();
      var entity = trends.toEntity();
      return Result.success(entity);
    } on SearchException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<List<SearchCoinEntity>>> getCoinsBySearch(String text, int page) async {
    try {
      var coin = await remoteDataSource.getCoinsBySearch(text, "usd", page);
      var coinList = coin.map((e) => e.toEntity()).toList();
      return Result.success(coinList);
    } on SearchException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
