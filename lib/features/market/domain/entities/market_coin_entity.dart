class MarketCoinEntity {
  final String marketCapRank;
  final String imageUrl;
  final String symbol;
  final String name;
  final String currentPrice;
  final String marketCap;
  final String id;
  final String priceChangePercentage1h;
  final String priceChangePercentage24h;
  final String priceChangePercentage7d;
  final String priceChangePercentage30d;
  final bool isPricePercentage1hPositive;
  final bool isPricePercentage24hPositive;
  final bool isPricePercentage7dPositive;
  final bool isPricePercentage30dPositive;

  MarketCoinEntity(
      {required this.marketCapRank,
      required this.imageUrl,
      required this.symbol,
      required this.name,
      required this.currentPrice,
      required this.marketCap,
      required this.id,
      required this.priceChangePercentage1h,
      required this.priceChangePercentage24h,
      required this.priceChangePercentage7d,
      required this.priceChangePercentage30d,
      required this.isPricePercentage1hPositive,
      required this.isPricePercentage24hPositive,
      required this.isPricePercentage30dPositive,
      required this.isPricePercentage7dPositive});
}
