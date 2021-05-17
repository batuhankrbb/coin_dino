import 'package:coin_dino/features/details/data/models/coin_chart_model.dart';
import 'package:coin_dino/features/details/data/models/coin_detail_model.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';

abstract class IDetailsRemoteDataSource {
  Future<CoinChartModel> getChart({required String id, required String days, required String vsCurrency, required String interval});
  Future<CoinDetailModel> getDetails({required String id});
}
