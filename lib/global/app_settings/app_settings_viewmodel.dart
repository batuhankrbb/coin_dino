import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'app_settings_viewmodel.g.dart';


class AppSettingsViewModel = _AppSettingsViewModelBase
    with _$AppSettingsViewModel;

abstract class _AppSettingsViewModelBase with Store {
  IPreferenceRepository _preferenceRepository =
      getit.get<IPreferenceRepository>();

  @observable
  late ThemeData themeData;

  void setUpSettings() async {
    var theme = await _preferenceRepository.getThemePreference();
    changeThemeData(theme);
  }

  void changeThemeData(Result<ThemePreferenceEntity> theme) { //* Bunu viewmodeller içinde kullanıcaz  yani repodan dönen şeyi vericez burası bende
    theme.when(success: (data) {
      switch (data) {
        case ThemePreferenceEntity.dark:
          themeData = ThemeData.dark();
          break;
        case ThemePreferenceEntity.light:
          themeData = ThemeData.light();
          break;
      }
    }, failure: (failure) {
      themeData = ThemeData.light();
    });
  }
}
