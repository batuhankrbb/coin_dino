import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/features/market/domain/repository_contracts/i_market_coin_repository.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:mobx/mobx.dart';
part 'cyrpyo_currency_viewmodel.g.dart';

class CyrptoCurrencyViewModel = _CyrptoCurrencyViewModelBase
    with _$CyrptoCurrencyViewModel;

abstract class _CyrptoCurrencyViewModelBase with Store {
  final IMarketCoinRepository imarketCoinRepository;

  @observable
  StateResult<List<MarketCoinEntity>> stateResult = StateResult.initial();

  _CyrptoCurrencyViewModelBase({required this.imarketCoinRepository});

  @observable
  MarketDate marketDate = MarketDate.day1;

  @observable
  MarketSort marketSort = MarketSort.market_cap_desc;

  List<String> dataColumnArray = [
    "#",
    "Symbol",
    "Coin",
    "Price",
    "24\nHours",
    "Market\nCap"
  ];

  @action
  Future<void> getCyrptoCurrency() async {
    var data = await imarketCoinRepository.getCryptoCurrencies(
        date: marketDate, sort: marketSort);
    data.when(success: (data) {
      stateResult = StateResult.completed(data);
    }, failure: (message) {
      stateResult = StateResult.failed(message);
    });
  }
}
