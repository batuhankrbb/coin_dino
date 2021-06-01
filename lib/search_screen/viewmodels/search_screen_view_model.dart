import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/features/search/data/repository/search_repository.dart';
import 'package:coin_dino/features/search/domain/entity/search_coin_entity.dart';
import 'package:coin_dino/features/search/domain/entity/search_trend_entity.dart';
import 'package:coin_dino/features/search/domain/repository_contract/i_search_repository.dart';
import 'package:mobx/mobx.dart';
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

  @action
  Future<void> getAllTrends() async {
    var trends = await searchRepository.getAllTrends();
    trends.when(success: (data) {
      searchTrendResult = StateResult.completed(data);
    }, failure: (failure) {
      searchTrendResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getSearchCoins(String text) async { 
    //TODO THROTTLING - DEBOUNCING YAPILACAK
 var coins = await searchRepository.getCoinsBySearch(text);
    coins.when(success: (data) {
      searchCoinsResult = StateResult.completed(data);
    }, failure: (failure) {
      searchCoinsResult = StateResult.failed(failure);
    });
  }
}
