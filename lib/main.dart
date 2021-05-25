import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'core/hive/hive_helper.dart';
import 'features/preferences/domain/entity/theme_preference_entity.dart';
import 'global/app_settings/app_settings_viewmodel.dart';
import 'global/components/loading_screen_components.dart';
import 'global/extensions/material_extensions.dart';
import 'global/starting_files/injection_container.dart';

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

  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: appSettingsViewModel.themeData,
        home: HomePage(),
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "${appSettingsViewModel.themeData.accentColor}"),
            ElevatedButton(
              onPressed: () {
                appSettingsViewModel.setTheme(ThemePreferenceEntity.dark);
              },
              child: Text("tema dark"),
            ),
            ElevatedButton(
              onPressed: () {
                appSettingsViewModel.setTheme(ThemePreferenceEntity.light);
              },
              child: Text("tema light"),
            ),
          ],
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
        body: Center(
          child: LoadingScreen(),
        ),
      ),
    );
  }
}
