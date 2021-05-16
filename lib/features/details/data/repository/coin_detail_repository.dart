import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/features/details/domain/entity/coin_chart_entity.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/details/domain/repository_contract/i_coin_detail_repository.dart';

class CoinDetailRepository extends ICoinDetailRepository{
  @override
  Future<Result<CoinChartEntity>> getCoinChart(String id, String days) {
      // TODO: implement getCoinChart
      throw UnimplementedError();
    }
  
    @override
    Future<Result<CoinDetailEntity>> getCoinDetail(String id) {
    // TODO: implement getCoinDetail
    throw UnimplementedError();
  }

}