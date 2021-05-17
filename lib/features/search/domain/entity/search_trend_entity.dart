class SearchTrendEntity {
  final String id;
  final int coinID;
  final String name;
  final String symbol;
  final String thumbImage;
  final String smallImage;
  final String largeImage;
  final String slug;
  final double btcPrice;
  final int score;

  SearchTrendEntity(
      {required this.id,
      required this.coinID,
      required this.name,
      required this.symbol,
      required this.thumbImage,
      required this.smallImage,
      required this.largeImage,
      required this.slug,
      required this.btcPrice,
      required this.score});
}
