import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/features/details/domain/entity/coin_chart_entity.dart';
import 'package:coin_dino/features/details/domain/entity/coin_detail_entity.dart';
import 'package:coin_dino/features/details/domain/repository_contract/i_coin_detail_repository.dart';
import 'package:mobx/mobx.dart';
part 'detail_screen_view_model.g.dart';

class DetailScreenViewModel = _DetailScreenViewModelBase
    with _$DetailScreenViewModel;

abstract class _DetailScreenViewModelBase with Store {
  final ICoinDetailRepository detailRepository;

  _DetailScreenViewModelBase({required this.detailRepository});

  @observable
  StateResult<CoinDetailEntity> coinDetailResult = StateResult.initial();

  @observable
  StateResult<CoinChartEntity> coinChartResult = StateResult.initial();

  @action
  Future<void> getCoinDetails(String coinID) async {
    var detailsResult = await detailRepository.getCoinDetail(id: coinID);
    detailsResult.when(success: (data) {
      coinDetailResult = StateResult.completed(data);
    }, failure: (failure) {
      coinDetailResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getCharts(String coinID) async {
    var detailsResult = await detailRepository.getCoinDetail(id: coinID);
    detailsResult.when(success: (data) {
      coinDetailResult = StateResult.completed(data);
    }, failure: (failure) {
      coinDetailResult = StateResult.failed(failure);
    });
  }
}
