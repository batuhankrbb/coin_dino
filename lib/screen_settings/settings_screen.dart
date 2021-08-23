import 'package:auto_size_text/auto_size_text.dart';
import 'viewmodels/settings_view_model.dart';
import 'components/settings_form_header.dart';
import 'components/settings_options_section.dart';
import 'components/settings_others_section.dart';
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

import '../core/extensions/context_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

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
