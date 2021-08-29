// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppSettingsViewModel on _AppSettingsViewModelBase, Store {
  final _$appThemeAtom = Atom(name: '_AppSettingsViewModelBase.appTheme');

  @override
  ThemeData get appTheme {
    _$appThemeAtom.reportRead();
    return super.appTheme;
  }

  @override
  set appTheme(ThemeData value) {
    _$appThemeAtom.reportWrite(value, super.appTheme, () {
      super.appTheme = value;
    });
  }

  final _$showOnBoardAtom = Atom(name: '_AppSettingsViewModelBase.showOnBoard');

  @override
  bool get showOnBoard {
    _$showOnBoardAtom.reportRead();
    return super.showOnBoard;
  }

  @override
  set showOnBoard(bool value) {
    _$showOnBoardAtom.reportWrite(value, super.showOnBoard, () {
      super.showOnBoard = value;
    });
  }

  final _$isPremiumAtom = Atom(name: '_AppSettingsViewModelBase.isPremium');

  @override
  bool get isPremium {
    _$isPremiumAtom.reportRead();
    return super.isPremium;
  }

  @override
  set isPremium(bool value) {
    _$isPremiumAtom.reportWrite(value, super.isPremium, () {
      super.isPremium = value;
    });
  }

  final _$setUpSettingsAsyncAction =
      AsyncAction('_AppSettingsViewModelBase.setUpSettings');

  @override
  Future<void> setUpSettings() {
    return _$setUpSettingsAsyncAction.run(() => super.setUpSettings());
  }

  final _$checkOnBoardShowAsyncAction =
      AsyncAction('_AppSettingsViewModelBase.checkOnBoardShow');

  @override
  Future<void> checkOnBoardShow() {
    return _$checkOnBoardShowAsyncAction.run(() => super.checkOnBoardShow());
  }

  final _$stopShowingOnboardAsyncAction =
      AsyncAction('_AppSettingsViewModelBase.stopShowingOnboard');

  @override
  Future<void> stopShowingOnboard() {
    return _$stopShowingOnboardAsyncAction
        .run(() => super.stopShowingOnboard());
  }

  final _$getPremiumDataAsyncAction =
      AsyncAction('_AppSettingsViewModelBase.getPremiumData');

  @override
  Future<void> getPremiumData() {
    return _$getPremiumDataAsyncAction.run(() => super.getPremiumData());
  }

  final _$_AppSettingsViewModelBaseActionController =
      ActionController(name: '_AppSettingsViewModelBase');

  @override
  void setTheme(ThemePreferenceEntity themePreference) {
    final _$actionInfo = _$_AppSettingsViewModelBaseActionController
        .startAction(name: '_AppSettingsViewModelBase.setTheme');
    try {
      return super.setTheme(themePreference);
    } finally {
      _$_AppSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appTheme: ${appTheme},
showOnBoard: ${showOnBoard},
isPremium: ${isPremium}
    ''';
  }
}
