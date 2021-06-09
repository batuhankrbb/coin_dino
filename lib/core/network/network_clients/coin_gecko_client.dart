import 'package:freezed_annotation/freezed_annotation.dart';

import '../network_fetching/network_option_generator.dart';

part 'coin_gecko_client.freezed.dart';

@freezed
abstract class CoinGeckoClient extends NetworkOptionsGenerator
    with _$CoinGeckoClient {
  const CoinGeckoClient._() : super();
  const factory CoinGeckoClient.coinsMarket(
          String date, String sort, String? category, String vsCurrency) =
      CoinsMarket;
  const factory CoinGeckoClient.details(String id,
      {String? localization,
      String? tickers,
      String? marketdata,
      String? communitydata,
      String? developerdata,
      String? sparkline}) = Details;
  const factory CoinGeckoClient.marketChart(
      String id, String vsCurrency, String days, String interval) = MarketChart;
  const factory CoinGeckoClient.searchTrends() = SearchTrends;
  factory CoinGeckoClient.coinSearch(String text, String vsCurrency) =
      CoinSearch;
  factory CoinGeckoClient.getAlertCoins(
      List<String> coinIds, String vsCurrency) = GetAlertCoins;

  @override
  String get baseURL => "https://api.coingecko.com/api/v3";

  @override
  String get networkPath => this.when(
      details: (String id,
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
      marketChart:
          (String id, String vsCurrency, String days, String interval) =>
              "/coins/$id/market_chart",
      searchTrends: () => "/search/trending",
      coinSearch: (String text, String vsCurrency) => "/coins/markets",
      getAlertCoins: (List<String> coinIds, String vsCurrency) =>
          "/coins/markets");

  @override
  String get networkMethod => this.when(
      details: (_,
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
      marketChart: (_, String vsCurrency, String days, String interval) =>
          "GET",
      searchTrends: () => "GET",
      coinSearch: (_, x) => "GET",
      getAlertCoins: (List<String> coinIds, String vsCurrency) => "GET");

  @override
  Map<String, dynamic>? get queryParameters => this.when(
        details: (
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
          "per_page": 250
        },
        marketChart: (_, String vsCurrency, String days, String interval) =>
            {"vs_currency": vsCurrency, "days": days, "interval": interval},
        searchTrends: () => null,
        coinSearch: (String text, String vsCurrency) => {
          "vs_currency": vsCurrency,
          "order": "market_cap_desc",
          "price_change_percentage": "24h",
          "per_page": 250
        },
        getAlertCoins: (List<String> coinIds, String vsCurrency) =>
            {"vs_currency": vsCurrency, "ids": coinIds},
      );

  @override
  Map<String, dynamic>? get header => null;
}
