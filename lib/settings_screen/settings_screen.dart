import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/core/mini_services/rating/rating_service.dart';
import 'package:coin_dino/core/mini_services/share/share_service.dart';
import 'package:coin_dino/core/mini_services/url_launcher_service/url_launcher_service.dart';
import 'package:coin_dino/features/preferences/domain/entity/language_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/global/components/selection_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../global/components/app_bar_components.dart';
import '../global/components/state_result_builder.dart';
import '../global/starting_files/injection_container.dart';
import 'components/settings_iap_card.dart';
import 'components/settings_icon.dart';
import 'view_model/settings_view_model.dart';

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
    setUpSettings();
  }

  Future<void> setUpSettings() async {
    await settingsViewModel.getBaseCurrencyPreference();
    await settingsViewModel.getLanguagePreference();
    await settingsViewModel.getThemePreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarComponent(title: "Settings"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              settingsSection(),
              SizedBox(height: 10),
              SettingInAppPurchaseCardWidget(),
              SizedBox(height: 10),
              othersSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingsSection() {
    return CupertinoFormSection(
      header: SettingsFormHeader(
        headerTitle: "Settings",
        headerIcon: Icon(Icons.settings),
      ),
      children: [
        buildStateResultForTheme(),
        buildStateResultForLanguage(),
        buildStateResultForBaseCurrency(),
      ],
    );
  }

  Widget buildStateResultForBaseCurrency() {
    return Observer(builder: (_) {
      return StateResultBuilder<String>(
          stateResult: settingsViewModel.baseCurrencyPreference,
          completedWidget: (data) {
            return SettingFormRowWidget(
              leading: SettingsIcon(iconData: Icons.money),
              title: "Currency",
              subTitle: "Base currency for the application",
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            );
          },
          loadingWidget: CupertinoActivityIndicator(),
          failureWidget: (failure) {
            return SizedBox();
          });
    });
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
                trailing: Icon(Icons.chevron_right),
                onTap: () async {
                  var allLanguages = await settingsViewModel
                      .getAllLanguages(); //* BURASI TEST İÇİN. DÜZELECEK
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SelectionPage(
                        title: "Language",
                        dataList: allLanguages,
                        isListingActive: false,
                        onSelect: (value) {
                          //TODO vm üzerinden set etme
                        },
                        selectedIndex:
                            0); //TODO verilen elemanın indexini döndüren list extensionu yazacağım --
                  }));
                },
              );
            },
            loadingWidget: CupertinoActivityIndicator(),
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
              onTap: () {},
            );
          },
          loadingWidget: CupertinoActivityIndicator(),
          failureWidget: (failure) {
            return SizedBox();
          });
    });
  }

  Widget othersSection() {
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
}

class SettingsFormHeader extends StatelessWidget {
  final String headerTitle;
  final Widget headerIcon;
  const SettingsFormHeader(
      {Key? key, required this.headerTitle, required this.headerIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(headerTitle),
          Spacer(),
          headerIcon,
        ],
      ),
    );
  }
}

class SettingFormRowWidget extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const SettingFormRowWidget(
      {Key? key,
      required this.leading,
      this.subTitle,
      required this.title,
      this.trailing,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              leading,
              Spacer(flex: 5),
              Expanded(
                flex: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(title,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    getSubtitle(),
                  ],
                ),
              ),
              Spacer(flex: 6),
              getTrailing(),
            ],
          )),
    );
  }

  Widget getSubtitle() {
    if (subTitle == null) return SizedBox();
    return AutoSizeText(
      subTitle!,
      style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    );
  }

  Widget getTrailing() {
    if (trailing == null) return SizedBox();
    return Expanded(flex: 13, child: trailing!);
  }
}
