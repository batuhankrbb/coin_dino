import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_entity.dart';
import 'package:coin_dino/features/market/domain/repository_contracts/i_market_coin_repository.dart';
import 'package:coin_dino/features/market/presentation/utils/listing_enums.dart';
import 'package:mobx/mobx.dart';
part 'home_screen_view_model.g.dart';

class HomeScreenViewModel = _HomeScreenViewModelBase with _$HomeScreenViewModel;

abstract class _HomeScreenViewModelBase with Store {
  final IMarketCoinRepository marketCoinRepository;

  _HomeScreenViewModelBase({required this.marketCoinRepository});

  @observable
  var marketDate = MarketDate.hour24;

  @observable
  var marketSort = MarketSort.market_cap_asc;

  StateResult<List<MarketCoinEntity>> coinListResult = StateResult.initial();

  @action
  Future<void> getCoinList() async {
    var result = await marketCoinRepository.getCryptoCurrencies(
        date: marketDate, sort: marketSort);
    result.when(success: (data) {
      coinListResult = StateResult.completed(data);
    }, failure: (failure) {
      coinListResult = StateResult.failed(failure);
    });
  }

  
}

/*
abstract class IMarketCoinRepository {
  Future<Result<List<MarketCoinEntity>>> getCryptoCurrencies(
      {required MarketDate date,
      required MarketSort sort,
      MarketCoinCategoryEntity? category});

  Future<Result<List<MarketCoinCategoryEntity>>> getAllCategories();
}


*/