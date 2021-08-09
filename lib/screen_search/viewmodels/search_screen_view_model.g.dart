// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_screen_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchScreenViewModel on _SearchScreenViewModelBase, Store {
  final _$searchCoinsResultAtom =
      Atom(name: '_SearchScreenViewModelBase.searchCoinsResult');

  @override
  StateResult<List<SearchCoinEntity>> get searchCoinsResult {
    _$searchCoinsResultAtom.reportRead();
    return super.searchCoinsResult;
  }

  @override
  set searchCoinsResult(StateResult<List<SearchCoinEntity>> value) {
    _$searchCoinsResultAtom.reportWrite(value, super.searchCoinsResult, () {
      super.searchCoinsResult = value;
    });
  }

  final _$searchTrendResultAtom =
      Atom(name: '_SearchScreenViewModelBase.searchTrendResult');

  @override
  StateResult<SearchTrendEntity> get searchTrendResult {
    _$searchTrendResultAtom.reportRead();
    return super.searchTrendResult;
  }

  @override
  set searchTrendResult(StateResult<SearchTrendEntity> value) {
    _$searchTrendResultAtom.reportWrite(value, super.searchTrendResult, () {
      super.searchTrendResult = value;
    });
  }

  final _$searchCoinResultToShowAtom =
      Atom(name: '_SearchScreenViewModelBase.searchCoinResultToShow');

  @override
  ObservableList<SearchCoinEntity> get searchCoinResultToShow {
    _$searchCoinResultToShowAtom.reportRead();
    return super.searchCoinResultToShow;
  }

  @override
  set searchCoinResultToShow(ObservableList<SearchCoinEntity> value) {
    _$searchCoinResultToShowAtom
        .reportWrite(value, super.searchCoinResultToShow, () {
      super.searchCoinResultToShow = value;
    });
  }

  final _$currentPageAtom =
      Atom(name: '_SearchScreenViewModelBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$currentTextAtom =
      Atom(name: '_SearchScreenViewModelBase.currentText');

  @override
  String get currentText {
    _$currentTextAtom.reportRead();
    return super.currentText;
  }

  @override
  set currentText(String value) {
    _$currentTextAtom.reportWrite(value, super.currentText, () {
      super.currentText = value;
    });
  }

  final _$isScrolledAtom = Atom(name: '_SearchScreenViewModelBase.isScrolled');

  @override
  bool get isScrolled {
    _$isScrolledAtom.reportRead();
    return super.isScrolled;
  }

  @override
  set isScrolled(bool value) {
    _$isScrolledAtom.reportWrite(value, super.isScrolled, () {
      super.isScrolled = value;
    });
  }

  final _$tabIndexAtom = Atom(name: '_SearchScreenViewModelBase.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$getAllTrendsAsyncAction =
      AsyncAction('_SearchScreenViewModelBase.getAllTrends');

  @override
  Future<void> getAllTrends() {
    return _$getAllTrendsAsyncAction.run(() => super.getAllTrends());
  }

  final _$getSearchCoinsAsyncAction =
      AsyncAction('_SearchScreenViewModelBase.getSearchCoins');

  @override
  Future<void> getSearchCoins(String text) {
    return _$getSearchCoinsAsyncAction.run(() => super.getSearchCoins(text));
  }

  final _$getCoinNextPageAsyncAction =
      AsyncAction('_SearchScreenViewModelBase.getCoinNextPage');

  @override
  Future<void> getCoinNextPage() {
    return _$getCoinNextPageAsyncAction.run(() => super.getCoinNextPage());
  }

  @override
  String toString() {
    return '''
searchCoinsResult: ${searchCoinsResult},
searchTrendResult: ${searchTrendResult},
searchCoinResultToShow: ${searchCoinResultToShow},
currentPage: ${currentPage},
currentText: ${currentText},
isScrolled: ${isScrolled},
tabIndex: ${tabIndex}
    ''';
  }
}
