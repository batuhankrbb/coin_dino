import '../../../../core/utils/number_helper.dart';

import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entities/market_coin_entity.dart';

class MarketCoinModel extends BaseNetworkModel {
  MarketCoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.priceChangePercentage1HInCurrency,
    required this.priceChangePercentage24HInCurrency,
    required this.priceChangePercentage30DInCurrency,
    required this.priceChangePercentage7DInCurrency,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;
  final num marketCap;
  final int? marketCapRank;

  final num? priceChangePercentage1HInCurrency;
  final num? priceChangePercentage24HInCurrency;
  final num? priceChangePercentage30DInCurrency;
  final num? priceChangePercentage7DInCurrency;

  @override
  fromJson(Map<String, dynamic> json) {
    return MarketCoinModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: json["current_price"] ?? -1,
      marketCap: json["market_cap"] ?? -1,
      marketCapRank: json["market_cap_rank"] ?? -1,
      priceChangePercentage1HInCurrency:
          json["price_change_percentage_1h_in_currency"],
      priceChangePercentage24HInCurrency:
          json["price_change_percentage_24h_in_currency"],
      priceChangePercentage30DInCurrency:
          json["price_change_percentage_30d_in_currency"],
      priceChangePercentage7DInCurrency:
          json["price_change_percentage_7d_in_currency"],
    );
  }

  Map<String, dynamic> toJson() => {};

  MarketCoinEntity toEntity() {
    return MarketCoinEntity(
      marketCapRank: marketCapRank != -1 ? marketCapRank.toString() : "-",
      imageUrl: image,
      symbol: symbol.toUpperCase(),
      name: name,
      currentPrice: currentPrice != -1
          ? "\$${NumberHelper.shared.toCommaString(number: currentPrice, digitNumber: 5)}"
          : "-",
      marketCap: marketCap != -1
          ? "\$${NumberHelper.shared.toCommaString(number: marketCap, digitNumber: 8)}"
          : "-",
      id: id,
      priceChangePercentage1h:
         NumberHelper.shared.toPercentageText(priceChangePercentage1HInCurrency),
      priceChangePercentage24h:
          NumberHelper.shared.toPercentageText(priceChangePercentage24HInCurrency),
      priceChangePercentage7d:
           NumberHelper.shared.toPercentageText(priceChangePercentage7DInCurrency),
      priceChangePercentage30d:
          NumberHelper.shared.toPercentageText(priceChangePercentage30DInCurrency),
      isPricePercentage1hPositive:
          (priceChangePercentage1HInCurrency ?? 0) >= 0,
      isPricePercentage24hPositive:
          (priceChangePercentage24HInCurrency ?? 0) >= 0,
      isPricePercentage7dPositive:
          (priceChangePercentage7DInCurrency ?? 0) >= 0,
      isPricePercentage30dPositive:
          (priceChangePercentage30DInCurrency ?? 0) >= 0,
    );
  }
}

class Roi {
  Roi({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  final double times;
  final String currency;
  final double percentage;

  factory Roi.fromJson(Map<String, dynamic> json) => Roi(
        times: json["times"],
        currency: json["currency"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "times": times,
        "currency": currency,
        "percentage": percentage,
      };
}
