import 'package:freezed_annotation/freezed_annotation.dart';
import '../network_fetching/network_option_generator.dart';

part 'network_clients.freezed.dart';

@freezed
abstract class NetworkClients extends NetworkOptionsGenerator
    with _$NetworkClients {
  const NetworkClients._() : super();
  const factory NetworkClients.coinsMarket(
      String vsCurrency,
      String? ids,
      String? category,
      String? order,
      int? perPage,
      int? page,
      bool? sparkline,
      String? priceChangePercentage) = CoinsMarket;
  factory NetworkClients.coinsID(String id,
      {String? localization,
      String? tickers,
      String? marketdata,
      String? communitydata,
      String? developerdata,
      String? sparkline}) = CoinsID;
  factory NetworkClients.martketChart(
      String id, String vsCurrency, String days, String interval) = MarketChart;

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
      coinsMarket: (String vsCurrency,
              String? ids,
              String? category,
              String? order,
              int? perPage,
              int? page,
              bool? sparkline,
              String? priceChangePercentage) =>
          "/coins/markets",
      martketChart:
          (String id, String vsCurrency, String days, String interval) =>
              "/coins/$id/market_chart");

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
      coinsMarket: (String vsCurrency,
              String? ids,
              String? category,
              String? order,
              int? perPage,
              int? page,
              bool? sparkline,
              String? priceChangePercentage) =>
          "GET",
      martketChart: (_, String vsCurrency, String days, String interval) =>
          "GET");

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
      coinsMarket: (String vsCurrency,
              String? ids,
              String? category,
              String? order,
              int? perPage,
              int? page,
              bool? sparkline,
              String? priceChangePercentage) =>
          {
            "vs_currency": vsCurrency,
            "ids": ids,
            "category": category,
            "order": order,
            "per_page": perPage ?? 100,
            "page": page ?? 1,
            "sparkline": sparkline ?? false,
            "price_change_percentage": priceChangePercentage,
          },
      martketChart: (_, String vsCurrency, String days, String interval) =>
          {"vs_currency": vsCurrency, "days": days, "interval": interval});

  @override
  Map<String, dynamic>? get header => null;
}
