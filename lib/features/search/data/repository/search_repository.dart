import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/search/data/data_sources/contracts/i_search_remote_data_source.dart';
import 'package:coin_dino/features/search/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/search/data/exception_handling/exceptions/search_exception.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/features/search/domain/entity/search_trend_entity.dart';
import 'package:coin_dino/features/search/domain/repository_contract/i_repository_contract.dart';

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
  Future<Result<List<SearchCoinEntity>>> getCoinsBySearch(String text) async {
    try {
      var coin = await remoteDataSource.getCoinsBySearch(text);
      var coinList = coin.map((e) => e.toEntity()).toList();
      return Result.success(coinList);
    } on SearchException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
