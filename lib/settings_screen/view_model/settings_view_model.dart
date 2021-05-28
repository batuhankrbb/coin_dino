import 'package:coin_dino/core/result_types/state_result.dart';
import 'package:coin_dino/core/user_interface/helpers/alert_helper.dart';
import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/entity/language_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:mobx/mobx.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  final IPreferenceRepository preferenceRepository;

  _SettingsViewModelBase({required this.preferenceRepository});

  StateResult<ThemePreferenceEntity> themePreference = StateResult.initial();

  StateResult<LanguagePreferenceEntity> languagePreference =
      StateResult.initial();

  StateResult<String> baseCurrencyPreference = StateResult.initial();

  Future<void> getThemePreference() async {
    var themePreferenceResult = await preferenceRepository.getThemePreference();

    themePreferenceResult.when(success: (data) {
      themePreference = StateResult.completed(data);
    }, failure: (failure) {
      themePreference = StateResult.failed(failure);
    });
  }

  Future<void> getLanguagePreference() async {
    var languagePreferenceResult =
        await preferenceRepository.getLanguagePreference();

    languagePreferenceResult.when(success: (data) {
      languagePreference = StateResult.completed(data);
    }, failure: (failure) {
      languagePreference = StateResult.failed(failure);
    });
  }

  Future<void> getBaseCurrencyPreference() async {
    var baseCurrenciesResult =
        await preferenceRepository.getBaseCurrencyPreference();
    baseCurrenciesResult.when(success: (data) {
      baseCurrencyPreference = StateResult.completed(data);
    }, failure: (failure) {
      baseCurrencyPreference = StateResult.failed(failure);
    });
  }

  Future<List<String>> getAllBaseCurrencies() async {
    var currenciesResult =
        await preferenceRepository.getAllSupportedBaseCurrencies();

    return currenciesResult.when(success: (data) {
      return data;
    }, failure: (failure) {
      return [];
    });
  }

  Future<List<String>> getAllThemes() async {
    var themesResult = await preferenceRepository.getAllThemes();
    return themesResult.map((e) => e.rawValue).toList();
  }

  Future<void> setThemePreference(
      ThemePreferenceEntity preferenceEntity) async {
    await preferenceRepository.setThemePreference(preferenceEntity);
  }

  Future<void> setLanguagePreference(
      LanguagePreferenceEntity preferenceEntity) async {
    await preferenceRepository.setLangaugePreference(preferenceEntity);
  }

  Future<void> setBaseCurrencyPreference(String baseCurrency) async {
    await preferenceRepository.setBaseCurrencyPreference(baseCurrency);
  }
}
