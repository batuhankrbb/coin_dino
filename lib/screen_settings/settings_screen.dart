import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/screen_settings/components/settings_form_header.dart';
import '../core/mini_services/rating/rating_service.dart';
import '../core/mini_services/share/share_service.dart';
import '../core/mini_services/url_launcher/url_launcher_service.dart';
import '../features/preferences/domain/entity/language_preference_entity.dart';
import '../features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'components/settings_form_row.dart';
import 'components/settings_iap_card.dart';
import 'components/settings_icon.dart';
import 'view_model/settings_view_model.dart';
import 'package:coin_dino/core/extensions/context_extensions.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsViewModel settingsViewModel = getit.get<SettingsViewModel>();

  @override
  void initState() {
    super.initState();
    settingsViewModel.setUpSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context,title: "Settings"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              buildSettingsSection(),
              SizedBox(height: 10),
              SettingInAppPurchaseCardWidget(),
              SizedBox(height: 10),
              buildOthersSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingsSection() {
    return CupertinoFormSection(
      header: SettingsFormHeader(
        headerTitle: "Settings",
        headerIcon: Icon(Icons.settings),
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
                trailing: Icon(Icons.chevron_right,),
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

  Widget buildOthersSection() {
    return CupertinoFormSection(
      header: SettingsFormHeader(
        headerTitle: "Others",
        headerIcon: Icon(Icons.apps),
      ),
      children: [
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.share),
          title: "Share",
          onTap: () async {
            await ShareService.shared.shareApp();
          },
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.mail),
          title: "Contact",
          subTitle: "Contract with us to tell your problems & suggestions",
          onTap: () async {
            await UrlLauncherService.shared.sendContactEmail();
          },
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.star),
          title: "Rate App",
          subTitle: "Support us",
          onTap: () async {
            await RatingService.shared.requestReview();
          },
        )
      ],
    );
  }

  Future<void> languageOnTap(LanguagePreferenceEntity data) async {
    var allLanguages = await settingsViewModel.getAllLanguages();
    settingsViewModel.tapAndNavigate(allLanguages, "Languages", allLanguages.indexOf(data.rawValue),  (value) {
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
