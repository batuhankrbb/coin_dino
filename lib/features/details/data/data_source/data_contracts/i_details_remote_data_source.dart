import 'package:coin_dino/features/details/data/models/coins_chart_model.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';

abstract class IDetailsRemoteDataSource {
  Future<CoinChartModel> getChart(String id, String days, String vsCurrency);
  Future<CoinDetailEntity> getDetails(String id);
}
