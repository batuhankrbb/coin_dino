import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:coin_dino/global/extensions/material_extensions.dart';
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
  ThemeData themeData = MaterialExtensions.lightModeTheme;

  @action
  Future<void> setUpSettings() async {
    var theme = await _preferenceRepository.getThemePreference();
    theme.when(success: (data) {
      changeThemeData(data);
    }, failure: (failure) {
      print(failure.message);
      themeData = MaterialExtensions.lightModeTheme;
    });
  }

  @action
  void changeThemeData(ThemePreferenceEntity theme) {
    //* Bunu viewmodeller içinde kullanıcaz yani repoya verdiğimiz şeyi bunada vericez burası bende
    switch (theme) {
      case ThemePreferenceEntity.dark:
        themeData = MaterialExtensions.darkModeTheme;
        break;
      case ThemePreferenceEntity.light:
        themeData = MaterialExtensions.lightModeTheme;
        break;
    }
  }
}
