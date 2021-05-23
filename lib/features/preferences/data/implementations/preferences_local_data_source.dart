
import '../../../../core/hive/hive_constants.dart';
import '../../../../core/hive/hive_helper.dart';
import '../contracts/i_preferences_local_data_source.dart';
import '../exception_handling/exceptions/preferences_exceptions.dart';
import 'package:flutter/services.dart' show rootBundle;

class PreferencesLocalDataSource implements IPreferencesLocalDataSource {
  var _hiveHelper = HiveHelper.shared;

  @override
  Future<String> getBaseCurrencyPreference() async {
    try {
      var currencyPreference = await _hiveHelper.getData<String>(
          HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_BASE_CURRENCY_PREFERENCE);
      return currencyPreference;
    } catch (e) {
      throw PreferencesException.baseCurrencyFetchingException();
    }
  }

  @override
  Future<String> getLanguagePreference() async {
    try {
      var languagePreference = await _hiveHelper.getData<String>(
          HiveConstants.BOX_PREFERENCES, HiveConstants.KEY_LANGUAGE_PREFERENCE);
      return languagePreference;
    } catch (e) {
      throw PreferencesException.languageFetchingException();
    }
  }

  @override
  Future<String> getThemePreference() async {
    try {
      var themePreference = await _hiveHelper.getData<String>(
          HiveConstants.BOX_PREFERENCES, HiveConstants.KEY_THEME_PREFERENCE);
      return themePreference;
    } catch (e) {
      throw PreferencesException.themeFetchingException();
    }
  }

  @override
  Future<void> setBaseCurrencyPreference(String currencyPreference) async {
    try {
      await _hiveHelper.putData(HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_BASE_CURRENCY_PREFERENCE, currencyPreference);
    } catch (e) {
      throw PreferencesException.baseCurrencySetException();
    }
  }

  @override
  Future<void> setLangaugePreference(String languagePreference) async {
    try {
      await _hiveHelper.putData(HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_LANGUAGE_PREFERENCE, languagePreference);
    } catch (e) {
      throw PreferencesException.languageSetException();
    }
  }

  @override
  Future<void> setThemePreference(String themePreference) async {
    try {
      await _hiveHelper.putData(HiveConstants.BOX_PREFERENCES,
          HiveConstants.KEY_THEME_PREFERENCE, themePreference);
    } catch (e) {
      throw PreferencesException.themeSetException();
    }
  }

  @override
  Future<List<String>> getAllSupportedBaseCurrencies() async {
    try {
      final String localJsonPath = 'assets/json/vs_currency.json';
      var localData = await rootBundle.loadString(localJsonPath);
      return [localData];
    } catch (e) {
      throw PreferencesException.supportedCurrenciesFetchingException();
    }
  }
}
