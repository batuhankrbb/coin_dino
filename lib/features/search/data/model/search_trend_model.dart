import 'package:coin_dino/core/network/network_fetching/base_network_model.dart';
import 'package:coin_dino/features/search/domain/entity/search_trend_entity.dart';

class SearchTrendModel extends BaseNetworkModel {
  SearchTrendModel({
    required this.coins,
    required this.exchanges,
  });

  final List<Coin> coins;
  final List<dynamic> exchanges;



  Map<String, dynamic> toJson() => {
        "coins": List<dynamic>.from(coins.map((x) => x.toJson())),
        "exchanges": List<dynamic>.from(exchanges.map((x) => x)),
      };

  @override
  SearchTrendModel fromJson(Map<String, dynamic> json) {
 return SearchTrendModel(
        coins: List<Coin>.from(json["coins"].map((x) => Coin.fromJson(x))),
        exchanges: List<dynamic>.from(json["exchanges"].map((x) => x)),
      );
  }

  @override
  toEntity() {
    // TODO: SERCAN
  }

  
}

class Coin {
  Coin({
    required this.item,
  });

  final Item item;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "item": item.toJson(),
      };
}

class Item {
  Item({
    required this.id,
    required this.coinId,
    required this.name,
    required this.symbol,
    required this.marketCapRank,
    required this.thumb,
    required this.small,
    required this.large,
    required this.slug,
    required this.priceBtc,
    required this.score,
  });

  final String id;
  final int coinId;
  final String name;
  final String symbol;
  final int marketCapRank;
  final String thumb;
  final String small;
  final String large;
  final String slug;
  final double priceBtc;
  final int score;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        coinId: json["coin_id"],
        name: json["name"],
        symbol: json["symbol"],
        marketCapRank: json["market_cap_rank"],
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
        slug: json["slug"],
        priceBtc: json["price_btc"].toDouble(),
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "coin_id": coinId,
        "name": name,
        "symbol": symbol,
        "market_cap_rank": marketCapRank,
        "thumb": thumb,
        "small": small,
        "large": large,
        "slug": slug,
        "price_btc": priceBtc,
        "score": score,
      };
}
