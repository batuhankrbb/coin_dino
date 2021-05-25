// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppSettingsViewModel on _AppSettingsViewModelBase, Store {
  final _$themeDataAtom = Atom(name: '_AppSettingsViewModelBase.themeData');

  @override
  ThemeData get themeData {
    _$themeDataAtom.reportRead();
    return super.themeData;
  }

  @override
  set themeData(ThemeData value) {
    _$themeDataAtom.reportWrite(value, super.themeData, () {
      super.themeData = value;
    });
  }

  final _$setUpSettingsAsyncAction =
      AsyncAction('_AppSettingsViewModelBase.setUpSettings');

  @override
  Future<void> setUpSettings() {
    return _$setUpSettingsAsyncAction.run(() => super.setUpSettings());
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
themeData: ${themeData}
    ''';
  }
}
