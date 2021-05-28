import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/global/components/app_bar_components.dart';
import 'package:coin_dino/global/components/custom_autosize_text.dart';
import 'package:coin_dino/global/components/state_result_builder.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/settings_screen/components/settings_icon.dart';
import 'package:coin_dino/settings_screen/view_model/settings_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'components/settings_iap_card.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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
    settingsViewModel.getBaseCurrencyPreference();
    settingsViewModel.getLanguagePreference();
    settingsViewModel.getThemePreference();
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
        StateResultBuilder(
            stateResult: settingsViewModel.themePreference,
            completedWidget: (data) {
              return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.palette),
                title: "Theme",
                trailing: Icon(Icons.chevron_right),
              );
            },
            failureWidget: (failure) {
              return SizedBox();
            }),
        StateResultBuilder(
            stateResult: settingsViewModel.themePreference,
            completedWidget: (data) {
              return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.language),
                title: "Language",
                trailing: Icon(Icons.chevron_right),
              );
            },
            failureWidget: (failure) {
              return SizedBox();
            }),
        StateResultBuilder(
            stateResult: settingsViewModel.themePreference,
            completedWidget: (data) {
              return SettingFormRowWidget(
                leading: SettingsIcon(iconData: Icons.money),
                title: "Currency",
                subTitle: "Base currency for the application",
                trailing: Icon(Icons.chevron_right),
              );
            },
            failureWidget: (failure) {
              return SizedBox();
            }),
      ],
    );
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
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.mail),
          title: "Contact",
          subTitle: "Contract with us to tell your problems & suggestions",
        ),
        SettingFormRowWidget(
          leading: SettingsIcon(iconData: Icons.star),
          title: "Rate App",
          subTitle: "Support us",
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
  const SettingFormRowWidget(
      {Key? key,
      required this.leading,
      this.subTitle,
      required this.title,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
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
