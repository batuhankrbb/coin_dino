class AlertEntity {
  final String coindID;
  final String name;
  final String image;
  final String symbol;
  final num currentPrice;
  final num? targetPrice;
  final bool? alertForBigNumber;

  AlertEntity({
    required this.coindID,
    required this.name,
    required this.image,
    required this.symbol,
    required this.currentPrice,
    this.targetPrice,
    this.alertForBigNumber
  });

  static AlertEntity copyWithTargetPrice(AlertEntity entity, num? targetPrice) {
    return AlertEntity(
        coindID: entity.coindID,
        name: entity.name,
        image: entity.image,
        symbol: entity.symbol,
        currentPrice: entity.currentPrice,
        targetPrice: targetPrice ?? entity.currentPrice);
  }
}
