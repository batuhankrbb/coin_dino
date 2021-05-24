import 'package:coin_dino/core/hive/hive_helper.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/global/app_settings/app_settings_viewmodel.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global/extensions/material_extensions.dart';

void main() async {
  await HiveHelper.shared.setUpHive();
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

  final AppSettingsViewModel appSettingsViewModel = getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: appSettingsViewModel.themeData,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ElevatedButton(
          child: Text("sa"),
          onPressed: () {
            appSettingsViewModel.changeThemeData(ThemePreferenceEntity.dark);
          },
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: MaterialExtensions.lightModeTheme,
      darkTheme: MaterialExtensions.darkModeTheme,
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
