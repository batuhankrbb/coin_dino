class CoinDetailEntity {
  final String id;
  final String symbol;
  final String name;
  final dynamic assetPlatformId;
  final int blockTimeInMinutes;
  final String hashingAlgorithm;
  final List<String> categories;
  final dynamic publicNotice;
  final List<dynamic> additionalNotices;
  final String description;

  CoinDetailEntity(
      this.id,
      this.symbol,
      this.name,
      this.assetPlatformId,
      this.blockTimeInMinutes,
      this.hashingAlgorithm,
      this.categories,
      this.publicNotice,
      this.additionalNotices,
      this.description);
}
