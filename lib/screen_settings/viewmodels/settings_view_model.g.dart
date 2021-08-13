// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  final _$themePreferenceAtom =
      Atom(name: '_SettingsViewModelBase.themePreference');

  @override
  StateResult<ThemePreferenceEntity> get themePreference {
    _$themePreferenceAtom.reportRead();
    return super.themePreference;
  }

  @override
  set themePreference(StateResult<ThemePreferenceEntity> value) {
    _$themePreferenceAtom.reportWrite(value, super.themePreference, () {
      super.themePreference = value;
    });
  }

  final _$languagePreferenceAtom =
      Atom(name: '_SettingsViewModelBase.languagePreference');

  @override
  StateResult<LanguagePreferenceEntity> get languagePreference {
    _$languagePreferenceAtom.reportRead();
    return super.languagePreference;
  }

  @override
  set languagePreference(StateResult<LanguagePreferenceEntity> value) {
    _$languagePreferenceAtom.reportWrite(value, super.languagePreference, () {
      super.languagePreference = value;
    });
  }

  final _$getThemePreferenceAsyncAction =
      AsyncAction('_SettingsViewModelBase.getThemePreference');

  @override
  Future<void> getThemePreference() {
    return _$getThemePreferenceAsyncAction
        .run(() => super.getThemePreference());
  }

  final _$getLanguagePreferenceAsyncAction =
      AsyncAction('_SettingsViewModelBase.getLanguagePreference');

  @override
  Future<void> getLanguagePreference() {
    return _$getLanguagePreferenceAsyncAction
        .run(() => super.getLanguagePreference());
  }

  @override
  String toString() {
    return '''
themePreference: ${themePreference},
languagePreference: ${languagePreference}
    ''';
  }
}
