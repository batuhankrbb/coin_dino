import '../../domain/entity/alert_entity.dart';

import '../../../../core/network/network_fetching/base_network_model.dart';

class AlertCoinModel extends BaseNetworkModel {
  AlertCoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;

  @override
  fromJson(Map<String, dynamic> json) {
    return AlertCoinModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: json["current_price"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
      };

  AlertEntity toEntity(num targetPrice, bool alertForBigNumber) {
    return AlertEntity(
        coindID: id,
        name: name,
        image: image,
        symbol: symbol,
        currentPrice: currentPrice,
        targetPrice: targetPrice,alertForBigNumber: alertForBigNumber);
  }
}