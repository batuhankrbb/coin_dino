import 'package:coin_dino/core/network/network_clients/coin_gecko_client.dart';

import '../../core/result_types/state_result.dart';
import '../../features/details/data/models/coin_detail_model.dart';
import '../../features/market/domain/entities/market_coin_category_entity.dart';
import '../../features/market/domain/entities/market_coin_entity.dart';
import '../../features/market/domain/repository_contracts/i_market_coin_repository.dart';
import '../../features/market/presentation/utils/listing_enums.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_screen_view_model.g.dart';

class HomeScreenViewModel = _HomeScreenViewModelBase with _$HomeScreenViewModel;

abstract class _HomeScreenViewModelBase with Store {
  final IMarketCoinRepository marketCoinRepository;

  _HomeScreenViewModelBase({required this.marketCoinRepository});

  @observable
  var marketDate = MarketDate.hour24;

  @observable
  var marketSort = MarketSort.market_cap_desc;

  @observable
  MarketCoinCategoryEntity selectedCategory = MarketCoinCategoryEntity(
      categoryID: "all", categoryName: "All"); //* all -> no category

  @observable
  var categoryList = ObservableList<MarketCoinCategoryEntity>();

  @observable
  ObservableList<MarketCoinEntity> coinListToShow = ObservableList();

  @observable
  var currentPage = 1;

  @observable
  bool isScrolled = false;

  @observable
  StateResult<List<MarketCoinEntity>> coinListResult = StateResult.initial();

  List<ReactionDisposer> _disposers = [];

  ScrollController scrollController = ScrollController();

  void setUpViewModel() {
    getAllCategories();
    if (coinListToShow.isEmpty) {
      getCoinList();
    }
    if (_disposers.isEmpty) {
      _disposers = [
        reaction<MarketDate>((_) => marketDate, (newValue) {
          refreshPage();
        }),
        reaction<MarketSort>((_) => marketSort, (newValue) {
          refreshPage();
        }),
        reaction<MarketCoinCategoryEntity>((_) => selectedCategory, (newValue) {
          refreshPage();
        }),
      ];
    }
  }

  void refreshPage() {
    getCoinList();
    scrollController.jumpTo(scrollController.position.minScrollExtent);
  }

  void disposeReactions() {
    _disposers.forEach((element) {
      element.reaction.dispose();
    });
  }

  @action
  Future<void> getCoinList() async {
    currentPage = 1;
    coinListResult = StateResult.loading();
    var result = await marketCoinRepository.getCryptoCurrencies(
        date: marketDate,
        sort: marketSort,
        page: currentPage,
        category:
            selectedCategory.categoryID == "all" ? null : selectedCategory);
    result.when(success: (data) {
      coinListResult = StateResult.completed(data);
      coinListToShow.clear();
      coinListToShow.addAll(data);
    }, failure: (failure) {
      coinListToShow.clear();
      coinListResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getCoinListNextPage() async {
    isScrolled = true;
    currentPage += 1;
    var result = await marketCoinRepository.getCryptoCurrencies(
        date: marketDate,
        sort: marketSort,
        page: currentPage,
        category: selectedCategory);
    result.when(success: (data) {
      coinListToShow.addAll(data);
      isScrolled = false;
    }, failure: (failure) {
      coinListResult = StateResult.failed(failure);
      isScrolled = false;
    });
  }

  @action
  Future<void> getAllCategories() async {
    if (categoryList.isEmpty) {
      var result = await marketCoinRepository.getAllCategories();
      result.when(
          success: (data) {
            print("suceess ${data[5].categoryID}");
            categoryList.clear();
            categoryList.addAll(data);
          },
          failure: (failure) {});
    }
  }

  String getPriceChange(MarketCoinEntity data) {
    switch (marketDate) {
      case MarketDate.hour1:
        return data.priceChangePercentage1h;

      case MarketDate.hour24:
        return data.priceChangePercentage24h;

      case MarketDate.day7:
        return data.priceChangePercentage7d;

      case MarketDate.day30:
        return data.priceChangePercentage30d;
    }
  }

  bool getPriceChangePositivity(MarketCoinEntity data) {
    switch (marketDate) {
      case MarketDate.hour1:
        return data.isPricePercentage1hPositive;

      case MarketDate.hour24:
        return data.isPricePercentage24hPositive;

      case MarketDate.day7:
        return data.isPricePercentage7dPositive;

      case MarketDate.day30:
        return data.isPricePercentage30dPositive;
    }
  }
}
