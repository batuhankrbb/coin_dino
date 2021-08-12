import 'package:coin_dino/features/preferences/domain/entity/language_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/screen_settings/components/settings_form_header.dart';
import 'package:coin_dino/screen_settings/components/settings_form_row.dart';
import 'package:coin_dino/screen_settings/components/settings_icon.dart';
import 'package:coin_dino/screen_settings/view_model/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SettingsOptionSection extends StatelessWidget {
   SettingsOptionSection({Key? key}) : super(key: key);

   SettingsViewModel settingsViewModel = getit.get<SettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      header: SettingsFormHeader(
        headerTitle: "Settings",
        headerIcon: Icons.settings,
      ),
      children: [
        buildStateResultForTheme(),
        buildStateResultForLanguage(),
      ],
    );
  }

  Widget buildStateResultForLanguage() {
    return Observer(
      builder: (_) {
        return StateResultBuilder<LanguagePreferenceEntity>(
            stateResult: settingsViewModel.languagePreference,
            completedWidget: (data) {
              return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.language),
                title: "Language",
                trailing: Icon(
                  Icons.chevron_right,
                ),
                onTap: () async {
                  await languageOnTap(data);
                },
              );
            },
            failureWidget: (failure) {
              return SizedBox();
            });
      },
    );
  }

  Widget buildStateResultForTheme() {
    return Observer(builder: (_) {
      return StateResultBuilder<ThemePreferenceEntity>(
          stateResult: settingsViewModel.themePreference,
          completedWidget: (data) {
            return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.palette),
                title: "Theme",
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  await themeOnTap(data);
                });
          },
          failureWidget: (failure) {
            return SizedBox();
          });
    });
  }

  Future<void> languageOnTap(LanguagePreferenceEntity data) async {
    var allLanguages = await settingsViewModel.getAllLanguages();
    settingsViewModel.tapAndNavigate(
        allLanguages, "Languages", allLanguages.indexOf(data.rawValue),
        (value) {
      settingsViewModel.setLanguagePreference(allLanguages[value]);
    });
  }

  Future<void> themeOnTap(ThemePreferenceEntity data) async {
    var allThemes = await settingsViewModel.getAllThemes();
    settingsViewModel.tapAndNavigate(
        allThemes, "Themes", allThemes.indexOf(data.rawValue), (value) {
      settingsViewModel.setThemePreference(allThemes[value]);
    });
  }
}