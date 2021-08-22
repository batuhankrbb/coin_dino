import '../../global/components/failure_widget.dart';
import '../viewmodels/settings_view_model.dart';

import '../../features/preferences/domain/entity/language_preference_entity.dart';
import '../../features/preferences/domain/entity/theme_preference_entity.dart';
import '../../global/components/state_result_builder.dart';
import '../../global/starting_files/injection_container.dart';
import 'settings_form_header.dart';
import 'settings_form_row.dart';
import 'settings_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/extensions/context_extensions.dart';

class SettingsOptionSection extends StatelessWidget {
  SettingsOptionSection({Key? key}) : super(key: key);

  SettingsViewModel settingsViewModel = getit.get<SettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      backgroundColor: context.colorScheme.primaryVariant,
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
