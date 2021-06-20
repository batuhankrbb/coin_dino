// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenViewModel on _HomeScreenViewModelBase, Store {
  final _$marketDateAtom = Atom(name: '_HomeScreenViewModelBase.marketDate');

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

  final _$marketSortAtom = Atom(name: '_HomeScreenViewModelBase.marketSort');

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

  @override
  String toString() {
    return '''
marketDate: ${marketDate},
marketSort: ${marketSort}
    ''';
  }
}
