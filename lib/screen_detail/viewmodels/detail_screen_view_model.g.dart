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

  final _$appBarTitleAtom =
      Atom(name: '_DetailScreenViewModelBase.appBarTitle');

  @override
  String get appBarTitle {
    _$appBarTitleAtom.reportRead();
    return super.appBarTitle;
  }

  @override
  set appBarTitle(String value) {
    _$appBarTitleAtom.reportWrite(value, super.appBarTitle, () {
      super.appBarTitle = value;
    });
  }

  final _$appbarCoinImageAtom =
      Atom(name: '_DetailScreenViewModelBase.appbarCoinImage');

  @override
  String get appbarCoinImage {
    _$appbarCoinImageAtom.reportRead();
    return super.appbarCoinImage;
  }

  @override
  set appbarCoinImage(String value) {
    _$appbarCoinImageAtom.reportWrite(value, super.appbarCoinImage, () {
      super.appbarCoinImage = value;
    });
  }

  final _$appBarSymbolAtom =
      Atom(name: '_DetailScreenViewModelBase.appBarSymbol');

  @override
  String get appBarSymbol {
    _$appBarSymbolAtom.reportRead();
    return super.appBarSymbol;
  }

  @override
  set appBarSymbol(String value) {
    _$appBarSymbolAtom.reportWrite(value, super.appBarSymbol, () {
      super.appBarSymbol = value;
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
  Future<void> getCharts(
      {required String coinID,
      required String days,
      String interval = "daily"}) {
    return _$getChartsAsyncAction.run(
        () => super.getCharts(coinID: coinID, days: days, interval: interval));
  }

  @override
  String toString() {
    return '''
coinDetailResult: ${coinDetailResult},
coinChartResult: ${coinChartResult},
appBarTitle: ${appBarTitle},
appbarCoinImage: ${appbarCoinImage},
appBarSymbol: ${appBarSymbol}
    ''';
  }
}
