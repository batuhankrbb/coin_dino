import 'package:coin_dino/global/app_settings/app_settings_viewmodel.dart';
import 'package:coin_dino/screen_onboard/onboard_screen.dart';
import 'package:coin_dino/xscreen_main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'global/starting_files/injection_container.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  var appSettingsViewModel = getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (appSettingsViewModel.showOnBoard) {
        return OnboardScreen();
      } else {
        return MainScreen();
      }
    });
  }
}
