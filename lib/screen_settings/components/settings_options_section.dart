import '../../global/components/failure_widget.dart';
import '../viewmodels/settings_view_model.dart';
import '../../core/extensions/context_extensions.dart';

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
import 'package:easy_localization/easy_localization.dart';

class SettingsOptionSection extends StatelessWidget {
  SettingsOptionSection({Key? key}) : super(key: key);

  SettingsViewModel settingsViewModel = getit.get<SettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection(
      backgroundColor: context.colorScheme.primaryVariant,
      header: SettingsFormHeader(
        headerTitle: "SETTINGS_SCREEN.FORM_HEADER_SETTINGS".tr(),
        headerIcon: Icons.settings,
      ),
      children: [
        buildStateResultForTheme(context),
        buildStateResultForLanguage(context),
      ],
    );
  }

  Widget buildStateResultForLanguage(BuildContext context) {
    return Observer(
      builder: (_) {
        return StateResultBuilder<LanguagePreferenceEntity>(
            stateResult: settingsViewModel.languagePreference,
            completedWidget: (data) {
              return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.language),
                title: "SETTINGS_SCREEN.FORM_LANGUAGE_TITLE".tr(),
                trailing: Icon(
                  Icons.chevron_right,
                  color: context.colorScheme.primary,
                ),
                onTap: () async {
                  await languageOnTap(data, context);
                },
              );
            },
            failureWidget: (failure) {
              return SizedBox();
            });
      },
    );
  }

  Widget buildStateResultForTheme(BuildContext context) {
    return Observer(builder: (_) {
      return StateResultBuilder<ThemePreferenceEntity>(
          stateResult: settingsViewModel.themePreference,
          completedWidget: (data) {
            return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.palette),
                title: "SETTINGS_SCREEN.FORM_THEME_TITLE".tr(),
                trailing: Icon(
                  Icons.chevron_right,
                  color: context.colorScheme.primary,
                ),
                onTap: () async {
                  await themeOnTap(data);
                });
          },
          failureWidget: (failure) {
            return SizedBox();
          });
    });
  }

  Future<void> languageOnTap(
      LanguagePreferenceEntity data, BuildContext context) async {
    var allLanguages = await settingsViewModel.getAllLanguages();
    settingsViewModel.tapAndNavigate(
        allLanguages,
        "SETTINGS_SCREEN.FORM_LANGUAGES_SELECTION_TITLE".tr(),
        allLanguages.indexOf(data.rawValue), (value) {
      settingsViewModel.setLanguagePreference(allLanguages[value], context);
    });
  }

  Future<void> themeOnTap(ThemePreferenceEntity data) async {
    var allThemes = await settingsViewModel.getAllThemes();
    settingsViewModel.tapAndNavigate(
        allThemes,
        "SETTINGS_SCREEN.FORM_THEMES_SELECTION_TITLE".tr(),
        allThemes.indexOf(data.rawValue), (value) {
      settingsViewModel.setThemePreference(allThemes[value]);
    });
  }
}
