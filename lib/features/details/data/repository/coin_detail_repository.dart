import '../../../../core/result_types/result.dart';
import '../../../preferences/data/contracts/i_preferences_local_data_source.dart';
import '../../domain/entity/coin_chart_entity.dart';
import '../../domain/entity/coin_detail_entity.dart';
import '../../domain/repository_contract/i_coin_detail_repository.dart';
import '../data_source/contracts/i_details_remote_data_source.dart';
import '../exception_handling/details_exception_handler.dart';
import '../exception_handling/exceptions/details_exceptions.dart';

class CoinDetailRepository extends ICoinDetailRepository {
  final IDetailsRemoteDataSource remoteDataSource;
  final DetailsExceptionHandler exceptionHandler;
  final IPreferencesLocalDataSource preferencesLocalDataSource;

  CoinDetailRepository(
      {required this.remoteDataSource,
      required this.exceptionHandler,
      required this.preferencesLocalDataSource});

  @override
  Future<Result<CoinChartEntity>> getCoinChart(
      {required String id,
      required String days,
      required String interval}) async {
    try {
      var baseCurrency = await getBaseCurrency();
      var chart = await remoteDataSource.getChart(
          id: id, days: days, vsCurrency: baseCurrency, interval: interval);
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
