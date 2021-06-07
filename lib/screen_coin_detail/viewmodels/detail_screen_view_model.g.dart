// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailScreenViewModel on _DetailScreenViewModelBase, Store {
  final _$coinDetailResultAtom =
      Atom(name: '_DetailScreenViewModelBase.coinDetailResult');

  @override
  StateResult<CoinDetailEntity> get coinDetailResult {
    _$coinDetailResultAtom.reportRead();
    return super.coinDetailResult;
  }

  @override
  set coinDetailResult(StateResult<CoinDetailEntity> value) {
    _$coinDetailResultAtom.reportWrite(value, super.coinDetailResult, () {
      super.coinDetailResult = value;
    });
  }

  final _$coinChartResultAtom =
      Atom(name: '_DetailScreenViewModelBase.coinChartResult');

  @override
  StateResult<CoinChartEntity> get coinChartResult {
    _$coinChartResultAtom.reportRead();
    return super.coinChartResult;
  }

  @override
  set coinChartResult(StateResult<CoinChartEntity> value) {
    _$coinChartResultAtom.reportWrite(value, super.coinChartResult, () {
      super.coinChartResult = value;
    });
  }

  final _$getCoinDetailsAsyncAction =
      AsyncAction('_DetailScreenViewModelBase.getCoinDetails');

  @override
  Future<void> getCoinDetails(String coinID) {
    return _$getCoinDetailsAsyncAction.run(() => super.getCoinDetails(coinID));
  }

  final _$getChartsAsyncAction =
      AsyncAction('_DetailScreenViewModelBase.getCharts');

  @override
  Future<void> getCharts(String coinID, String days, String interval) {
    return _$getChartsAsyncAction
        .run(() => super.getCharts(coinID, days, interval));
  }

  @override
  String toString() {
    return '''
coinDetailResult: ${coinDetailResult},
coinChartResult: ${coinChartResult}
    ''';
  }
}
