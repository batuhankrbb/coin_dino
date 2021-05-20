import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entity/coin_chart_entity.dart';

class CoinChartModel extends BaseNetworkModel {
  CoinChartModel({
    required this.prices,
    required this.marketCaps,
    required this.totalVolumes,
  });

  final List<List<double>> prices;
  final List<List<double>> marketCaps;
  final List<List<double>> totalVolumes;

  Map<String, dynamic> toJson() => {
        "prices": List<dynamic>.from(
            prices.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "market_caps": List<dynamic>.from(
            marketCaps.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "total_volumes": List<dynamic>.from(
            totalVolumes.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };

  @override
  fromJson(Map<String, dynamic> json) {
    return CoinChartModel(
      prices: List<List<double>>.from(json["prices"]
          .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
      marketCaps: List<List<double>>.from(json["market_caps"]
          .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
      totalVolumes: List<List<double>>.from(json["total_volumes"]
          .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
    );
  }

  @override
  CoinChartEntity toEntity() {
    return CoinChartEntity(
        prices: prices, marketCaps: marketCaps, totalVolumes: totalVolumes);
  }
}
