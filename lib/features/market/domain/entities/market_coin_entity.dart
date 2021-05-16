class MarketCoinEntity {
  final int marketCapRank;
  final String imageUrl;
  final String symbol;
  final String name;
  final double currentPrice;
  final double marketCap;
  final String id;
  final double? priceChangePercentage1h;
  final double? priceChangePercentage24h;
  final double? priceChangePercentage7d;
  final double? priceChangePercentage30d;

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
      required this.priceChangePercentage30d});
      
}
