import '../../../../core/result_types/result.dart';
import '../entity/coin_chart_entity.dart';
import '../entity/coin_detail_entity.dart';

abstract class ICoinDetailRepository {
  Future<Result<CoinDetailEntity>> getCoinDetail({required String id});
  Future<Result<CoinChartEntity>> getCoinChart({required String id, required String days, required String interval});
}
