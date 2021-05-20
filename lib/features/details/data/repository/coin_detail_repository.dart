
import '../../../../core/result_types/result.dart';
import '../../domain/entity/coin_chart_entity.dart';
import '../../domain/entity/coin_detail_entity.dart';
import '../../domain/repository_contract/i_coin_detail_repository.dart';
import '../data_source/contracts/i_details_remote_data_source.dart';
import '../exception_handling/details_exception_handler.dart';
import '../exception_handling/exceptions/details_exceptions.dart';

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
