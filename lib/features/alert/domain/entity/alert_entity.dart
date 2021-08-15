class AlertEntity {
  final String coindID;
  final String name;
  final String image;
  final String symbol;
  final num currentPrice;
  final num? targetPrice;

  AlertEntity({
    required this.coindID,
    required this.name,
    required this.image,
    required this.symbol,
    required this.currentPrice,
    this.targetPrice,
  });
}
