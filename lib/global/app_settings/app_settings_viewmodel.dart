import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app_settings_viewmodel.g.dart';

class AppSettingsViewModel = _AppSettingsViewModelBase
    with _$AppSettingsViewModel;

abstract class _AppSettingsViewModelBase with Store {
  IPreferenceRepository preferenceRepository =
      getit.get<IPreferenceRepository>();

  Future<ThemeData> getTheme() async {
    var themeData = await preferenceRepository.getThemePreference();
    themeData.when(success: (data) {}, failure: (failure) {});
    return ThemeData();
  }
  // LanguagePreferenceEntity languagePreferenceEntity = LanguagePreferenceEntity.turkish;

}
