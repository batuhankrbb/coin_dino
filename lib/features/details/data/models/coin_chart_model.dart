import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entity/coin_chart_entity.dart';
import '../../../../core/extensions/num_extension.dart';

class CoinChartModel extends BaseNetworkModel {
  CoinChartModel({
    required this.prices,
    this.marketCaps,
    this.totalVolumes,
  });

  final List<List<double>> prices;
  final List<List<double>>? marketCaps;
  final List<List<double>>? totalVolumes;

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
      prices: prices.map((e) => e[1]).toList(),
      dates: prices.map((e) => e[0].toDateTime()).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
