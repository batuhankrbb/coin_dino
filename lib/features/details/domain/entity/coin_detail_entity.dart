import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';

class CoinDetailEntity {
  final String id;
  final String symbol;
  final String name;
  final num price;
  final num priceChange24h;
  final num priceChange24hTable;
  final num priceChange7dTable;
  final num priceChange14dTable;
  final num priceChange30dTable;
  final num priceChange60dTable;
  final num priceChange1yTable;
  final String marketCapRank;
  final String marketCap;
  final String tradingVolume;
  final String highest24h;
  final String lowest24h;
  final String availableSuppy;
  final String totalSupply;
  final String allTimeHigh;
  final String sinceAllTimeHigh;
  final String allTimeHighDate;
  final String allTimeLow;
  final String sinceAllTimeLow;
  final String allTimeLowDate;
  final String homePageUrl;
  final String imageUrl;
  final String description;

  CoinDetailEntity(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.price,
      required this.priceChange24h,
      required this.priceChange24hTable,
      required this.priceChange7dTable,
      required this.priceChange14dTable,
      required this.priceChange30dTable,
      required this.priceChange60dTable,
      required this.priceChange1yTable,
      required this.marketCapRank,
      required this.marketCap,
      required this.tradingVolume,
      required this.highest24h,
      required this.lowest24h,
      required this.availableSuppy,
      required this.totalSupply,
      required this.allTimeHigh,
      required this.sinceAllTimeHigh,
      required this.allTimeHighDate,
      required this.allTimeLow,
      required this.sinceAllTimeLow,
      required this.allTimeLowDate,
      required this.homePageUrl,
      required this.imageUrl,
      required this.description});

  AlertEntity toAlertEntity() {
    return AlertEntity(
        coindID: id,
        name: name,
        image: imageUrl,
        targetPrice: price.toDouble(),
        price: price.toDouble());
  }
}
