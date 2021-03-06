import 'dart:convert';

import '../../../../core/utils/error_printer.dart';

import '../../domain/entity/language_preference_entity.dart';
import '../../domain/entity/theme_preference_entity.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../core/hive/hive_constants.dart';
import '../../../../core/hive/hive_helper.dart';
import '../contracts/i_preferences_local_data_source.dart';
import '../exception_handling/exceptions/preferences_exceptions.dart';

class PreferencesLocalDataSource implements IPreferencesLocalDataSource {
  var _hiveHelper = HiveHelper.shared;

  @override
  Future<String> getBaseCurrencyPreference() async {
    try {
      var currencyPreference = await _hiveHelper.getData<String>(
          HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_BASE_CURRENCY_PREFERENCE);
      return currencyPreference ?? "usd";
    } catch (e) {
      ErrorHelper.shared.printError(
          "PreferencesLocalDataSource/getBaseCurrencyPreference", e);
      throw PreferencesException.baseCurrencyFetchingException();
    }
  }

  @override
  Future<String> getLanguagePreference() async {
    try {
      var languagePreference = await _hiveHelper.getData<String>(
          HiveConstants.BOX_PREFERENCES, HiveConstants.KEY_LANGUAGE_PREFERENCE);
      return languagePreference ?? "english";
    } catch (e) {
      ErrorHelper.shared
          .printError("PreferencesLocalDataSource/getLanguagePreference", e);
      throw PreferencesException.languageFetchingException();
    }
  }

  @override
  Future<String> getThemePreference() async {
    try {
      var themePreference = await _hiveHelper.getData<String>(
          HiveConstants.BOX_PREFERENCES, HiveConstants.KEY_THEME_PREFERENCE);
      return themePreference ?? "light";
    } catch (e) {
      ErrorHelper.shared
          .printError("PreferencesLocalDataSource/getThemePreference", e);
      throw PreferencesException.themeFetchingException();
    }
  }

  @override
  Future<void> setBaseCurrencyPreference(String currencyPreference) async {
    try {
      await _hiveHelper.putData(HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_BASE_CURRENCY_PREFERENCE, currencyPreference);
    } catch (e) {
      ErrorHelper.shared.printError(
          "PreferencesLocalDataSource/setBaseCurrencyPreference", e);
      throw PreferencesException.baseCurrencySetException();
    }
  }

  @override
  Future<void> setLangaugePreference(String languagePreference) async {
    try {
      await _hiveHelper.putData(HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_LANGUAGE_PREFERENCE, languagePreference);
    } catch (e) {
      ErrorHelper.shared
          .printError("PreferencesLocalDataSource/setLangaugePreference", e);
      throw PreferencesException.languageSetException();
    }
  }

  @override
  Future<void> setThemePreference(String themePreference) async {
    try {
      await _hiveHelper.putData(HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_THEME_PREFERENCE, themePreference);
    } catch (e) {
      ErrorHelper.shared
          .printError("PreferencesLocalDataSource/setThemePreference", e);
      throw PreferencesException.themeSetException();
    }
  }

  @override
  Future<List<String>> getAllSupportedBaseCurrencies() async {
    try {
      final String localJsonPath = 'assets/json/vs_currency.json';
      var localData = await rootBundle.loadString(localJsonPath);
      List<dynamic> decodedData = jsonDecode(localData)["vs_currency"];
      var currencies = decodedData.map((e) => e.toString()).toList();
      return currencies;
    } catch (e) {
      ErrorHelper.shared.printError(
          "PreferencesLocalDataSource/getAllSupportedBaseCurrencies", e);
      throw PreferencesException.supportedCurrenciesFetchingException();
    }
  }

  @override
  Future<List<String>> getAllLanguages() async {
    return LanguagePreferenceEntity.values.map((e) => e.rawValue).toList();
  }

  @override
  Future<List<String>> getAllThemes() async {
    return ThemePreferenceEntity.values.map((e) => e.rawValue).toList();
  }
}
