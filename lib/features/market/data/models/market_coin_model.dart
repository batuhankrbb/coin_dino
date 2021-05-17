import 'package:coin_dino/core/network/network_fetching/base_network_model.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';

class MarketCoinModel extends BaseNetworkModel{
  MarketCoinModel({
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
  final double currentPrice;
  final int marketCap;
  final int marketCapRank;
  final int? fullyDilutedValuation;
  final int totalVolume;
  final double high24H;
  final double low24H;
  final double priceChange24H;
  final double priceChangePercentage24H;
  final double marketCapChange24H;
  final double marketCapChangePercentage24H;
  final double circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double ath;
  final double athChangePercentage;
  final DateTime athDate;
  final double atl;
  final double atlChangePercentage;
  final DateTime atlDate;
  final Roi? roi;
  final DateTime lastUpdated;
  final double priceChangePercentage1HInCurrency;
  final double priceChangePercentage24HInCurrency;
  final double priceChangePercentage30DInCurrency;
  final double priceChangePercentage7DInCurrency;

  
 @override
  fromJson(Map<String, dynamic> json) {
    return  MarketCoinModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"] == null
            ? null
            : json["fully_diluted_valuation"],
        totalVolume: json["total_volume"],
        high24H: json["high_24h"].toDouble(),
        low24H: json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        circulatingSupply: json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"] == null
            ? null
            : json["total_supply"].toDouble(),
        maxSupply:
            json["max_supply"] == null ? null : json["max_supply"].toDouble(),
        ath: json["ath"].toDouble(),
        athChangePercentage: json["ath_change_percentage"].toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"].toDouble(),
        atlChangePercentage: json["atl_change_percentage"].toDouble(),
        atlDate: DateTime.parse(json["atl_date"]),
        roi: json["roi"] == null ? null : Roi.fromJson(json["roi"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        priceChangePercentage1HInCurrency:
            json["price_change_percentage_1h_in_currency"].toDouble(),
        priceChangePercentage24HInCurrency:
            json["price_change_percentage_24h_in_currency"].toDouble(),
        priceChangePercentage30DInCurrency:
            json["price_change_percentage_30d_in_currency"].toDouble(),
        priceChangePercentage7DInCurrency:
            json["price_change_percentage_7d_in_currency"].toDouble(),
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



  MarketCoinEntity toEntity() {
    return MarketCoinEntity(
        marketCapRank: marketCapRank,
        imageUrl: image,
        symbol: symbol,
        name: name,
        currentPrice: currentPrice,
        marketCap: marketCap,
        id: id,
        priceChangePercentage1h: priceChangePercentage1HInCurrency,
        priceChangePercentage24h: priceChangePercentage24HInCurrency,
        priceChangePercentage7d: priceChangePercentage7DInCurrency,
        priceChangePercentage30d: priceChangePercentage30DInCurrency);
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
        times: json["times"].toDouble(),
        currency: json["currency"],
        percentage: json["percentage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "times": times,
        "currency": currency,
        "percentage": percentage,
      };
}
