import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entity/coin_chart_entity.dart';
import '../../../../core/extensions/num_extension.dart';

class CoinChartModel extends BaseNetworkModel {
  CoinChartModel({
    required this.prices,
  });

  final List<List<double>> prices;

  @override
  fromJson(Map<String, dynamic> json) {
    return CoinChartModel(
      prices: List<List<double>>.from(json["prices"] != null
          ? json["prices"]
              .map((x) => List<double>.from(x.map((x) => x.toDouble())))
          : null),
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
