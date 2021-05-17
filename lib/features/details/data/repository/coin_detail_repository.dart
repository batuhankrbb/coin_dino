import 'package:coin_dino/features/details/data/data_source/data_contracts/i_details_remote_data_source.dart';
import 'package:coin_dino/features/details/data/exception_handling/details_exception_handler.dart';
import 'package:coin_dino/features/details/data/exception_handling/exceptions/details_exceptions.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/features/details/domain/entity/coin_chart_entity.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/details/domain/repository_contract/i_coin_detail_repository.dart';

class CoinDetailRepository extends ICoinDetailRepository {
  final IDetailsRemoteDataSource remoteDataSource;
  final DetailsExceptionHandler exceptionHandler;

  CoinDetailRepository(
      {required this.remoteDataSource, required this.exceptionHandler});

//TODO vsCurrency preferencesdan alınacak ilerde
  @override
  Future<Result<CoinChartEntity>> getCoinChart(
      {required String id,
      required String days,
      required String interval}) async {
    try {
      var chart = await remoteDataSource.getChart(
          id: id, days: days, vsCurrency: "usd", interval: interval);
      return Result.success(chart.toEntity());
    } on DetailsException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<CoinDetailEntity>> getCoinDetail({required String id}) async {
    try {
      var details = await remoteDataSource.getDetails(id: id);
      return Result.success(details.toEntity());
    } on DetailsException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
