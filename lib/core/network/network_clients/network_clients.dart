import 'package:freezed_annotation/freezed_annotation.dart';
import '../network_fetching/network_option_generator.dart';

part 'network_clients.freezed.dart';

@freezed
abstract class NetworkClients extends NetworkOptionsGenerator
    with _$NetworkClients {
  const NetworkClients._() : super();
  const factory NetworkClients.coinsMarket() = CoinsMarket;
  factory NetworkClients.coinsID(String id) = CoinsID;
  factory NetworkClients.martketChart(String id) = MarketChart;

  @override
  String get baseURL => "https://api.coingecko.com/api/v3";

  @override
  String get networkPath => this.when(
      coinsID: (String id) => "/coins/$id",
      coinsMarket: () => "/coins/markets",
      martketChart: (String id) => "/coins/$id/market_chart");

  @override
  String get networkMethod => this.when(
      coinsID: (_) => "GET",
      coinsMarket: () => "GET",
      martketChart: (_) => "GET");

  @override
  Map<String, dynamic>? get queryParameters => this.when(
      coinsID: (id){
        "id" : id
      }, coinsMarket: () => null, martketChart: (_) => null);

  @override
  Map<String, dynamic>? get header => null;
}
