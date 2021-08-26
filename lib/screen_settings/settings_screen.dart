import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/extensions/context_extensions.dart';
import '../global/components/app_bar_components.dart';
import '../global/starting_files/injection_container.dart';
import 'components/settings_iap_card.dart';
import 'components/settings_options_section.dart';
import 'components/settings_others_section.dart';
import 'viewmodels/settings_view_model.dart';

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
      appBar: customAppBar(
          context: context, title: "SETTINGS_SCREEN.APP_BAR_TEXT".tr()),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SettingsOptionSection(),
              SizedBox(height: context.getHeight(0.03)),
              SettingInAppPurchaseCardWidget(),
              SizedBox(height: context.getHeight(0.03)),
              SettingsOtherSection(),
            ],
          ),
        ),
      ),
    );
  }
}
