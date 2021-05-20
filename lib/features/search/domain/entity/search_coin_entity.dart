class SearchCoinEntity{

  final num? marketCapRank;
  final String imageUrl;
  final String symbol;
  final String name;
  final num currentPrice;
  final num marketCap;
  final String id;
  final num? priceChangePercentage1h;
  final num? priceChangePercentage24h;
  final num? priceChangePercentage7d;
  final num? priceChangePercentage30d;

  SearchCoinEntity(
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