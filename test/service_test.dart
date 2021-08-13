import 'dart:io';
import 'package:coin_dino/core/hive/hive_constants.dart';
import 'package:coin_dino/features/alert/data/data_source/implementations/alert_local_data_source.dart';
import 'package:coin_dino/features/alert/data/data_source/implementations/alert_remote_data_source.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/alert/data/repository/alert_repository.dart';
import 'package:coin_dino/features/alert/domain/repository_contract/i_alert_repository.dart';
import 'package:coin_dino/features/details/data/data_source/implementations/details_remote_data_source.dart';
import 'package:coin_dino/features/details/data/exception_handling/details_exception_handler.dart';
import 'package:coin_dino/features/details/data/repository/coin_detail_repository.dart';
import 'package:coin_dino/features/details/domain/repository_contract/i_coin_detail_repository.dart';

import 'package:coin_dino/features/market/data/data_source/implementations/market_remote_data_source.dart';
import 'package:coin_dino/features/market/data/exception_handling/market_exception_handler.dart';
import 'package:coin_dino/features/market/data/repository/market_coin_repository.dart';
import 'package:coin_dino/features/market/domain/repository_contracts/i_market_coin_repository.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:coin_dino/features/preferences/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/preferences/data/implementations/preferences_local_data_source.dart';
import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/search/data/data_sources/implementations/search_remote_data_source.dart';
import 'package:coin_dino/features/search/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/search/data/repository/search_repository.dart';
import 'package:coin_dino/features/search/domain/repository_contract/i_search_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  group("market feature test", () {
    IMarketCoinRepository marketCoinRepository = MarketCoinRepository(
        exceptionHandler: MarketExceptionHandler(),
        marketRemoteDataSource: MarketRemoteDataSource(),
        preferencesLocalDataSource: PreferencesLocalDataSource());
    test("get crypto currencies", () async {
      var currencies = await marketCoinRepository.getCryptoCurrencies(
        page: 1,
          date: MarketDate.day7, sort: MarketSort.market_cap_asc);
      currencies.when(success: (data) {
        print("SUCCESS | get crypto currencies = ${data.length}");
        print(data.map((e) => e.marketCapRank));
      }, failure: (failure) {
        print("FAILURE | get crypto currencies = ${failure.message}");
      });
    });

    test("get all categories", () async {
      var currencies = await marketCoinRepository.getAllCategories();
      currencies.when(success: (data) {
        print("SUCCESS | get all categories = ${data.length}");
      }, failure: (failure) {
        print("FAILURE | get all categories = ${failure.message}");
      });
    });

    group("details feature test", () {
      ICoinDetailRepository detailCoinRepository = CoinDetailRepository(
          remoteDataSource: DetailsRemoteDataSource(),
          exceptionHandler: DetailsExceptionHandler(),
          preferencesLocalDataSource: PreferencesLocalDataSource());

      test("get chart", () async {
        var chart = await detailCoinRepository.getCoinChart(
            id: "bitcoin", days: "7", interval: "daily");
        chart.when(success: (data) {
          print("SUCCESS | get chart = ${data.prices.length}");
        }, failure: (failure) {
          print("FAILURE | get chart = ${failure.message}");
        });
      });

      test("get details", () async {
        var details = await detailCoinRepository.getCoinDetail(id: "bitcoin");
        details.when(success: (data) {
          print("SUCCESS | get details = ${data.name + data.symbol}");
        }, failure: (failure) {
          print("FAILURE | get details = ${failure.message}");
        });
      });
    });

    group("search feature test", () {
      ISearchRepository searchRepository = SearchRepository(
          remoteDataSource: SearchRemoteDataSource(),
          exceptionHandler: SearchExceptionHandler());

      test("get trends", () async {
        var trends = await searchRepository.getAllTrends();

        trends.when(success: (data) {
          print("SUCCESS | get trends = ${data.coinEntityList.length}");
        }, failure: (failure) {
          print("FAILURE | get trends = ${failure.message}");
        });
      });

      test("get coins by search", () async {
        var coins = await searchRepository.getCoinsBySearch("tElCo",0);
        var deneme = "selam".startsWith("sea");
        print(deneme);
        coins.when(success: (data) {
          print("SUCCESS | get coins by search = ${data.length}");
        }, failure: (failure) {
          print("FAILURE | get coins by search = ${failure.message}");
        });
      });
    });

    group("preferences test", () {
      var preferenceRepository = PreferenceRepository(
          preferencesLocalDataSource: PreferencesLocalDataSource(),
          exceptionHandler: PreferencesExceptionHandler());
      test("base currency get test", () async {
        Hive.init(Directory.current.path + "/test/service_test.dart");
        await Hive.openBox(HiveConstants.BOX_PREFERENCES);

        var baseCurrencyResult =
            await preferenceRepository.getBaseCurrencyPreference();
        baseCurrencyResult.when(success: (data) {
          print("SUCCESS | base currency get test = ${data}");
        }, failure: (failure) {
          print(
              "FAILURE | base currency get test = ${failure.message + "not yet. so, usd."}");
        });
      });

      test("base currency set test", () async {
        var baseCurrencyResult =
            await preferenceRepository.setBaseCurrencyPreference("bitcoin");
        baseCurrencyResult.when(success: (_) {
          print("SUCCESS | base currency set test");
        }, failure: (failure) {
          print(
              "FAILURE | base currency set test = ${failure.message + "you couldn't set knk"}");
        });
      });
    });

    group("alert test", () {
      IAlertRepository alertRepository = AlertRepository(
          localDataSource: AlertLocalDataSource(),
          exceptionHandler: AlertExceptionHandler(),
          remoteDataSource: AlertRemoteDataSource(),
          preferencesLocalDataSource: PreferencesLocalDataSource());
      test("description", () async {
        alertRepository.checkAlerts();
      });
    });
  });
}
