import 'package:coin_dino/features/details/data/data_source/data_implementations/details_remote_data_source.dart';
import 'package:coin_dino/features/details/data/exception_handling/details_exception_handler.dart';
import 'package:coin_dino/features/details/data/repository/coin_detail_repository.dart';
import 'package:coin_dino/features/details/domain/repository_contract/i_coin_detail_repository.dart';
import 'package:coin_dino/features/market/data/data_source/implementations/local_market_data_source.dart';
import 'package:coin_dino/features/market/data/data_source/implementations/remote_market_data_source.dart';
import 'package:coin_dino/features/market/data/exception_handling/market_exception_handler.dart';
import 'package:coin_dino/features/market/data/repository/market_coin_repository.dart';
import 'package:coin_dino/features/market/domain/repository_contracts/i_market_coin_repository.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:coin_dino/features/search/data/data_sources/implementations/search_remote_data_source.dart';
import 'package:coin_dino/features/search/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/search/data/repository/search_repository.dart';
import 'package:coin_dino/features/search/domain/repository_contract/i_repository_contract.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
 WidgetsFlutterBinding.ensureInitialized();
  group("market feature test", () {
    IMarketCoinRepository marketCoinRepository = MarketCoinRepository(
        remoteMarketDataSource: RemoteMarketDataSource(),
        localeMarketDataSource: LocalMarketDataSource(),
        exceptionHandler: MarketExceptionHandler());
    test("get crypto currencies", () async {
      var currencies = await marketCoinRepository.getCryptoCurrencies(
          date: MarketDate.day7, sort: MarketSort.market_cap_asc);
      currencies.when(success: (data) {
        print("SUCCESS | get crypto currencies = ${data.length}");
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
          exceptionHandler: DetailsExceptionHandler());

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
    });
  });
}
