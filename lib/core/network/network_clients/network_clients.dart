import 'package:freezed_annotation/freezed_annotation.dart';
import '../network_fetching/network_option_generator.dart';

part 'network_clients.freezed.dart';

@freezed
abstract class NetworkClients extends NetworkOptionsGenerator
    with _$NetworkClients {
  const NetworkClients._() : super();
  const factory NetworkClients.coinsMarket(
          String date, String sort, String? category, String vsCurrency) =
      CoinsMarket;
  factory NetworkClients.coinsID(String id,
      {String? localization,
      String? tickers,
      String? marketdata,
      String? communitydata,
      String? developerdata,
      String? sparkline}) = CoinsID;
  factory NetworkClients.martketChart(
      String id, String vsCurrency, String days, String interval) = MarketChart;
  const factory NetworkClients.searchTrends() = SearchTrends;

  @override
  String get baseURL => "https://api.coingecko.com/api/v3";

  @override
  String get networkPath => this.when(
      coinsID: (String id,
              String? localization,
              String? tickers,
              String? marketdata,
              String? communitydata,
              String? developerdata,
              String? sparkline) =>
          "/coins/$id",
      coinsMarket:
          (String date, String sort, String? category, String vsCurrency) =>
              "/coins/markets",
      martketChart:
          (String id, String vsCurrency, String days, String interval) =>
              "/coins/$id/market_chart",
      searchTrends: () => "/search/trending");

  @override
  String get networkMethod => this.when(
      coinsID: (String id,
              String? localization,
              String? tickers,
              String? marketdata,
              String? communitydata,
              String? developerdata,
              String? sparkline) =>
          "GET",
      coinsMarket:
          (String date, String sort, String? category, String vsCurrency) =>
              "GET",
      martketChart: (_, String vsCurrency, String days, String interval) =>
          "GET",
      searchTrends: () => "GET");

  @override
  Map<String, dynamic>? get queryParameters => this.when(
      coinsID: (
        String id,
        String? localization,
        String? tickers,
        String? marketdata,
        String? communitydata,
        String? developerdata,
        String? sparkline,
      ) {
        return {
          "id": id,
          "localization": localization ?? "true",
          "tickers": tickers ?? "true",
          "market_data": marketdata ?? "true",
          "community_data": communitydata ?? "true",
          "developer_data": developerdata ?? "true",
          "sparkline": sparkline ?? "false",
        };
      },
      coinsMarket:
          (String date, String sort, String? category, String vsCurrency) => {
                "vs_currency": vsCurrency,
                "category": category,
                "order": sort,
                "price_change_percentage": date,
              },
      martketChart: (_, String vsCurrency, String days, String interval) =>
          {"vs_currency": vsCurrency, "days": days, "interval": interval},
      searchTrends: () => null);

  @override
  Map<String, dynamic>? get header => null;
}
