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
  final num marketCapRank;
  final num? tradingVolume;
  final num? highest24h;
  final num? lowest24h;
  final num availableSuppy;
  final num totalSupply;
  final num? allTimeHigh;
  final num? sinceAllTimeHigh;
  final String allTimeHighDate;
  final num? allTimeLow;
  final num? sinceTimeLow;
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
      required this.tradingVolume,
      required this.highest24h,
      required this.lowest24h,
      required this.availableSuppy,
      required this.totalSupply,
      required this.allTimeHigh,
      required this.sinceAllTimeHigh,
      required this.allTimeHighDate,
      required this.allTimeLow,
      required this.sinceTimeLow,
      required this.allTimeLowDate,
      required this.homePageUrl,
      required this.imageUrl,
      required this.description});
}
