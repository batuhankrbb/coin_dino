import '../../models/coin_chart_model.dart';
import '../../models/coin_detail_model.dart';

abstract class IDetailsRemoteDataSource {
  Future<CoinChartModel> getChart({required String id, required String days, required String vsCurrency, required String interval});
  Future<CoinDetailModel> getDetails({required String id});
}
