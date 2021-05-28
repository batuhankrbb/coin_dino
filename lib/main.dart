import 'package:coin_dino/global/components/pull_to_refresh_builder.dart';
import 'package:coin_dino/global/components/selection_page.dart';
import 'package:coin_dino/settings_screen/components/settings_icon.dart';
import 'package:coin_dino/settings_screen/components/settings_switch.dart';
import 'package:coin_dino/settings_screen/settings_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'core/hive/hive_helper.dart';
import 'global/app_settings/app_settings_viewmodel.dart';
import 'global/extensions/material_extensions.dart';
import 'global/starting_files/injection_container.dart';
import 'global/starting_files/launch_app.dart';
import 'onboard_screen/onboard_screen.dart';

void main() async {
  await HiveHelper.shared.setUpHive();
  await launchApp();
  setupGetIt();
  await getit.get<AppSettingsViewModel>().setUpSettings();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        builder: DevicePreview.appBuilder,
        theme: appSettingsViewModel.themeData,
        home: SettingsScreen(),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SettingsScreen(),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MaterialExtensions.lightModeTheme,
      darkTheme: MaterialExtensions.darkModeTheme,
      home: Scaffold(
        body: Center(child: OnboardScreen()),
      ),
    );
  }
}
