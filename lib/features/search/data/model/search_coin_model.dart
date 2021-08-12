import '../../../../core/utils/number_helper.dart';

import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entity/search_coin_entity.dart';
import '../../../../core/extensions/num_extension.dart';

class SearchCoinModel extends BaseNetworkModel {
  SearchCoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
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
  final num? marketCapRank;
  final num? fullyDilutedValuation;
  final num totalVolume;
  final num? high24H;
  final num? low24H;
  final num? priceChange24H;
  final num? priceChangePercentage24H;
  final num? marketCapChange24H;
  final num? marketCapChangePercentage24H;
  final num circulatingSupply;
  final num? totalSupply;
  final num? maxSupply;
  final num ath;
  final num athChangePercentage;
  final DateTime athDate;
  final num atl;
  final num atlChangePercentage;
  final DateTime atlDate;
  final RoiSearch? roi;
  final DateTime lastUpdated;
  final num? priceChangePercentage1HInCurrency;
  final num? priceChangePercentage24HInCurrency;
  final num? priceChangePercentage30DInCurrency;
  final num? priceChangePercentage7DInCurrency;

  @override
  SearchCoinModel fromJson(Map<String, dynamic> json) {
    return SearchCoinModel(
      id: json["id"],
      symbol: json["symbol"],
      name: json["name"],
      image: json["image"],
      currentPrice: json["current_price"],
      marketCap: json["market_cap"],
      marketCapRank: json["market_cap_rank"],
      fullyDilutedValuation: json["fully_diluted_valuation"] == null
          ? null
          : json["fully_diluted_valuation"],
      totalVolume: json["total_volume"],
      high24H: json["high_24h"],
      low24H: json["low_24h"],
      priceChange24H: json["price_change_24h"],
      priceChangePercentage24H: json["price_change_percentage_24h"],
      marketCapChange24H: json["market_cap_change_24h"],
      marketCapChangePercentage24H: json["market_cap_change_percentage_24h"],
      circulatingSupply: json["circulating_supply"],
      totalSupply: json["total_supply"] == null ? null : json["total_supply"],
      maxSupply: json["max_supply"] == null ? null : json["max_supply"],
      ath: json["ath"],
      athChangePercentage: json["ath_change_percentage"],
      athDate: DateTime.parse(json["ath_date"]),
      atl: json["atl"],
      atlChangePercentage: json["atl_change_percentage"],
      atlDate: DateTime.parse(json["atl_date"]),
      roi: json["roi"] == null ? null : RoiSearch.fromJson(json["roi"]),
      lastUpdated: DateTime.parse(json["last_updated"]),
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation":
            fullyDilutedValuation == null ? null : fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply == null ? null : totalSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate.toIso8601String(),
        "roi": roi == null ? null : roi!.toJson(),
        "last_updated": lastUpdated.toIso8601String(),
        "price_change_percentage_1h_in_currency":
            priceChangePercentage1HInCurrency,
        "price_change_percentage_24h_in_currency":
            priceChangePercentage24HInCurrency,
        "price_change_percentage_30d_in_currency":
            priceChangePercentage30DInCurrency,
        "price_change_percentage_7d_in_currency":
            priceChangePercentage7DInCurrency,
      };

  SearchCoinEntity toEntity() {
    return SearchCoinEntity(
        marketCapRank: marketCapRank == null ? "-" : "$marketCapRank",
        imageUrl: image,
        symbol: symbol.toUpperCase(),
        name: name,
        currentPrice: NumberHelper.shared.toCommaString(number: currentPrice,digitNumber: 4),
        marketCap: "$marketCap",
        id: id,
        priceChangePercentage1h: priceChangePercentage1HInCurrency,
        priceChangePercentage24h: priceChangePercentage24HInCurrency,
        priceChangePercentage7d: priceChangePercentage7DInCurrency,
        priceChangePercentage30d: priceChangePercentage30DInCurrency);
  }
}

class RoiSearch {
  RoiSearch({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  final double times;
  final String currency;
  final double percentage;

  factory RoiSearch.fromJson(Map<String, dynamic> json) => RoiSearch(
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
