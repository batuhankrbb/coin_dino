import '../../global/app_settings/app_settings_viewmodel.dart';
import 'package:mobx/mobx.dart';

import '../../core/result_types/state_result.dart';
import '../../features/preferences/domain/entity/language_preference_entity.dart';
import '../../features/preferences/domain/entity/theme_preference_entity.dart';
import '../../features/preferences/domain/repository_contract/i_preference_repository.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  final IPreferenceRepository preferenceRepository;
  final AppSettingsViewModel appSettingsViewModel;

  _SettingsViewModelBase(
      {required this.preferenceRepository, required this.appSettingsViewModel});

  @observable
  StateResult<ThemePreferenceEntity> themePreference = StateResult.initial();

  @observable
  StateResult<LanguagePreferenceEntity> languagePreference =
      StateResult.initial();

  @observable
  StateResult<String> baseCurrencyPreference = StateResult.initial();

  @action
  Future<void> getThemePreference() async {
    var themePreferenceResult = await preferenceRepository.getThemePreference();

    themePreferenceResult.when(success: (data) {
      themePreference = StateResult.completed(data);
    }, failure: (failure) {
      themePreference = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getLanguagePreference() async {
    var languagePreferenceResult =
        await preferenceRepository.getLanguagePreference();

    languagePreferenceResult.when(success: (data) {
      languagePreference = StateResult.completed(data);
    }, failure: (failure) {
      languagePreference = StateResult.failed(failure);
    });
  }

  @action
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

  Future<List<String>> getAllLanguages() async {
    var languages = await preferenceRepository.getAllLanguages();
    var languagelist = languages.map((e) => e.rawValue).toList();
    return languagelist;
  }

  Future<void> setThemePreference(String preferenceEntity) async {
    await preferenceRepository
        .setThemePreference(preferenceEntity.toThemePrerence());
    appSettingsViewModel.setTheme(preferenceEntity.toThemePrerence());
    await getThemePreference();
  }

  Future<void> setLanguagePreference(String preferenceEntity) async {
    await preferenceRepository
        .setLangaugePreference(preferenceEntity.toLanguagePreference());
    await getLanguagePreference();
  }

  Future<void> setBaseCurrencyPreference(String baseCurrency) async {
    await preferenceRepository.setBaseCurrencyPreference(baseCurrency);
    await getBaseCurrencyPreference();
  }
}
