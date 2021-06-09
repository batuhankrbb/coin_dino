import '../../core/result_types/state_result.dart';
import '../../features/search/data/repository/search_repository.dart';
import '../../features/search/domain/entity/search_coin_entity.dart';
import '../../features/search/domain/entity/search_trend_entity.dart';
import '../../features/search/domain/repository_contract/i_search_repository.dart';
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

  @observable
  String appBarText = "Search";

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
    searchCoinsResult = StateResult.loading();
    var coins = await searchRepository.getCoinsBySearch(text);
    coins.when(success: (data) {
      searchCoinsResult = StateResult.completed(data);
    }, failure: (failure) {
      searchCoinsResult = StateResult.failed(failure);
    });
  }

  @action
  void changeAppBarText(int index) {
    appBarText = index == 0 ? "Search" : "Trends";
  }
}
