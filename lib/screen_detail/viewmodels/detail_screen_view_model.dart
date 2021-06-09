import '../../core/mini_services/share/share_service.dart';
import '../../core/mini_services/url_launcher/url_launcher_service.dart';
import '../../core/result_types/state_result.dart';
import '../../features/details/domain/entity/coin_chart_entity.dart';
import '../../features/details/domain/entity/coin_detail_entity.dart';
import '../../features/details/domain/repository_contract/i_coin_detail_repository.dart';
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

  @observable
  String appBarTitle = "Details";
  @observable
  String? appbarCoinImage;
  @observable
  String appBarCoinPrice = "0";

  @action
  Future<void> getCoinDetails(String coinID) async {
    coinDetailResult = StateResult.loading();
    var detailsResult = await detailRepository.getCoinDetail(id: coinID);
    detailsResult.when(success: (data) {
      coinDetailResult = StateResult.completed(data);
      appBarTitle = data.name;
      appBarCoinPrice = data.price.toString();
      appbarCoinImage = data.imageUrl;
      print(appbarCoinImage);
      print("completed $data");
    }, failure: (failure) {
      coinDetailResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getCharts(
      {required String coinID,
      required String days,
      String interval = "daily"}) async {
    coinChartResult = StateResult.loading();
    var detailsResult = await detailRepository.getCoinChart(
        id: coinID, days: days, interval: interval);
    detailsResult.when(success: (data) {
      coinChartResult = StateResult.completed(data);
    }, failure: (failure) {
      coinChartResult = StateResult.failed(failure);
    });
  }

  Future<void> shareCoin(String coinName) async {
    //TODO DÜZELTİLECEK
    await ShareService.shared.share(text: "HEY! Check out $coinName");
  }

  Future<void> openWebPage(String url) async {
    await UrlLauncherService.shared.openUrl(url);
  }
}
