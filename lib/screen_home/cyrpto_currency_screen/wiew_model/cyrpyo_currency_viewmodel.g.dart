// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cyrpyo_currency_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CyrptoCurrencyViewModel on _CyrptoCurrencyViewModelBase, Store {
  final _$stateResultAtom =
      Atom(name: '_CyrptoCurrencyViewModelBase.stateResult');

  @override
  StateResult<List<MarketCoinEntity>> get stateResult {
    _$stateResultAtom.reportRead();
    return super.stateResult;
  }

  @override
  set stateResult(StateResult<List<MarketCoinEntity>> value) {
    _$stateResultAtom.reportWrite(value, super.stateResult, () {
      super.stateResult = value;
    });
  }

  final _$marketDateAtom =
      Atom(name: '_CyrptoCurrencyViewModelBase.marketDate');

  @override
  MarketDate get marketDate {
    _$marketDateAtom.reportRead();
    return super.marketDate;
  }

  @override
  set marketDate(MarketDate value) {
    _$marketDateAtom.reportWrite(value, super.marketDate, () {
      super.marketDate = value;
    });
  }

  final _$marketSortAtom =
      Atom(name: '_CyrptoCurrencyViewModelBase.marketSort');

  @override
  MarketSort get marketSort {
    _$marketSortAtom.reportRead();
    return super.marketSort;
  }

  @override
  set marketSort(MarketSort value) {
    _$marketSortAtom.reportWrite(value, super.marketSort, () {
      super.marketSort = value;
    });
  }

  final _$getCyrptoCurrencyAsyncAction =
      AsyncAction('_CyrptoCurrencyViewModelBase.getCyrptoCurrency');

  @override
  Future<void> getCyrptoCurrency() {
    return _$getCyrptoCurrencyAsyncAction.run(() => super.getCyrptoCurrency());
  }

  @override
  String toString() {
    return '''
stateResult: ${stateResult},
marketDate: ${marketDate},
marketSort: ${marketSort}
    ''';
  }
}
