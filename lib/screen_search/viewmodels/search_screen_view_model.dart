import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../core/result_types/state_result.dart';
import '../../features/search/domain/entity/search_coin_entity.dart';
import '../../features/search/domain/entity/search_trend_entity.dart';
import '../../features/search/domain/repository_contract/i_search_repository.dart';

part 'search_screen_view_model.g.dart';

class SearchScreenViewModel = _SearchScreenViewModelBase
    with _$SearchScreenViewModel;

abstract class _SearchScreenViewModelBase with Store {
  final ISearchRepository searchRepository;

  _SearchScreenViewModelBase({required this.searchRepository});

  @observable
  StateResult<List<SearchCoinEntity>> searchCoinsResult = StateResult.initial();

  @observable
  StateResult<SearchTrendEntity> searchTrendResult = StateResult.initial();

  @observable
  ObservableList<SearchCoinEntity> searchCoinResultToShow = ObservableList();

  @observable
  int currentPage = 1;

  @observable
  TextEditingController textEditingController = TextEditingController();

  @observable
  bool isScrolled = false;

  @observable
  int tabIndex = 0;

  @action
  Future<void> setUpViewModel() async {
    if (searchCoinResultToShow.isEmpty) {
      getSearchCoins("");
    }
    searchTrendResult.maybeWhen(
        completed: (data) {
        },
        orElse: () {
          getAllTrends();
        });
  }

  @action
  Future<void> getAllTrends() async {
    searchTrendResult = StateResult.loading();
    var trends = await searchRepository.getAllTrends();
    trends.when(success: (data) {
      searchTrendResult = StateResult.completed(data);
    }, failure: (failure) {
      searchTrendResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getSearchCoins(String text) async {
    currentPage = 1;
    searchCoinsResult = StateResult.loading();
    var coins = await searchRepository.getCoinsBySearch(text, currentPage);
    coins.when(success: (data) {
      searchCoinsResult = StateResult.completed(data);
      searchCoinResultToShow.clear();
      searchCoinResultToShow.addAll(data);
    }, failure: (failure) {
      searchCoinsResult = StateResult.failed(failure);
      searchCoinResultToShow.clear();
    });
  }

  @action
  Future<void> getCoinNextPage() async {
    currentPage += 1;
    isScrolled = true;
    var coins =
        await searchRepository.getCoinsBySearch(textEditingController.text, currentPage);
    coins.when(success: (data) {
      searchCoinResultToShow.addAll(data);
      isScrolled = false;
    }, failure: (failure) {
      isScrolled = false;
      searchCoinResultToShow.clear();
      searchCoinsResult = StateResult.failed(failure);
    });
  }
}
