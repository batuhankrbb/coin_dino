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

  final _$appBarTextAtom = Atom(name: '_SearchScreenViewModelBase.appBarText');

  @override
  String get appBarText {
    _$appBarTextAtom.reportRead();
    return super.appBarText;
  }

  @override
  set appBarText(String value) {
    _$appBarTextAtom.reportWrite(value, super.appBarText, () {
      super.appBarText = value;
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

  final _$_SearchScreenViewModelBaseActionController =
      ActionController(name: '_SearchScreenViewModelBase');

  @override
  void changeAppBarText(int index) {
    final _$actionInfo = _$_SearchScreenViewModelBaseActionController
        .startAction(name: '_SearchScreenViewModelBase.changeAppBarText');
    try {
      return super.changeAppBarText(index);
    } finally {
      _$_SearchScreenViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchCoinsResult: ${searchCoinsResult},
searchTrendResult: ${searchTrendResult},
appBarText: ${appBarText}
    ''';
  }
}