import 'package:coin_dino/core/localization/localization_helper.dart';
import 'package:flutter/material.dart';

import '../../core/navigation/routes/navigation_route.dart';
import '../../core/navigation/services/navigation_service.dart';
import '../../global/components/selection_page/selection_page.dart';

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

  var didSetUp = false;

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

  Future<List<String>> getAllThemes() async {
    var themesResult = await preferenceRepository.getAllThemes();
    return themesResult.map((e) => e.rawValue).toList();
  }

  Future<List<String>> getAllLanguages() async {
    var languages = await preferenceRepository.getAllLanguages();
    return languages.map((e) => e.rawValue).toList();
  }

  Future<void> setThemePreference(String preferenceEntity) async {
    await preferenceRepository
        .setThemePreference(preferenceEntity.toThemePrerence());
    appSettingsViewModel.setTheme(preferenceEntity.toThemePrerence());
    await getThemePreference();
  }

  Future<void> setLanguagePreference(
      String preferenceEntity, BuildContext context) async {
    await preferenceRepository
        .setLangaugePreference(preferenceEntity.toLanguagePreference());
    await getLanguagePreference();
    await LocalizationHelper.shared
        .setLocale(preferenceEntity.toLanguagePreference(),context);
  }

  Future<void> setUpSettings() async {
    if (!didSetUp) {
      await getLanguagePreference();
      await getThemePreference();
      didSetUp = true;
    }
  }

  void tapAndNavigate(List<String> dataList, String title, int selectedIndex,
      Function(int) onSelect) {
    NavigationService.shared
        .navigateTo(NavigationRoute.toSelectionPage(SelectionPage(
      dataList: dataList,
      title: title,
      isListingActive: false,
      isCapitalActive: true,
      selectedIndex: selectedIndex,
      onSelect: onSelect,
    )));
  }
}
