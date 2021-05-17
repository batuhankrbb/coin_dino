import 'package:coin_dino/core/network/network_fetching/base_network_model.dart';

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
      {required this.id,
      required this.symbol,
      required this.name,
      required this.assetPlatformId,
      required this.blockTimeInMinutes,
      required this.hashingAlgorithm,
      required this.categories,
      required this.publicNotice,
      required this.additionalNotices,
      required this.description});
}
