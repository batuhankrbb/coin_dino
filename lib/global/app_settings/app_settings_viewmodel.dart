import 'package:coin_dino/core/hive/hive_constants.dart';
import 'package:coin_dino/core/hive/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../features/preferences/domain/entity/theme_preference_entity.dart';
import '../../features/preferences/domain/repository_contract/i_preference_repository.dart';
import '../utils/app_themes.dart';
import '../starting_files/injection_container.dart';

part 'app_settings_viewmodel.g.dart';

class AppSettingsViewModel = _AppSettingsViewModelBase
    with _$AppSettingsViewModel;

abstract class _AppSettingsViewModelBase with Store {
  IPreferenceRepository _preferenceRepository =
      getit.get<IPreferenceRepository>();

  @observable
  ThemeData themeData = AppThemes.shared.lightModeTheme;

  @observable
  bool showOnBoard = true;

  @action
  Future<void> setUpSettings() async {
    await checkOnBoardShow();
    var theme = await _preferenceRepository.getThemePreference();
    theme.when(success: (data) {
      setTheme(data);
    }, failure: (failure) {
      setTheme(ThemePreferenceEntity.light);
    });
  }

  @action
  void setTheme(ThemePreferenceEntity themePreference) {
    switch (themePreference) {
      case ThemePreferenceEntity.dark:
        themeData = AppThemes.shared.darkModeTheme;
        break;
      case ThemePreferenceEntity.light:
        themeData = AppThemes.shared.lightModeTheme;
        break;
    }
  }

  @action
  Future<void> checkOnBoardShow() async {
    showOnBoard = await HiveHelper.shared.getData<bool>(
            HiveConstants.BOX_STARTING, HiveConstants.KEY_ONBOARD_SHOW) ??
        true;
  }

  @action
  Future<void> stopShowingOnboard() async{
 await HiveHelper.shared.putData<bool>(
          HiveConstants.BOX_STARTING, HiveConstants.KEY_ONBOARD_SHOW, false);
  }
}
