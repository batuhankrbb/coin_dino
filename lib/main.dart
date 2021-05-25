import 'package:coin_dino/global/components/pull_to_refresh_builder.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'core/hive/hive_helper.dart';
import 'features/preferences/domain/entity/theme_preference_entity.dart';
import 'global/app_settings/app_settings_viewmodel.dart';
import 'global/components/empty_data_compnents.dart';
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
          Container(
            height: 500,
            width: 300,
            child: PullToRefreshBuilder(
              onLoading: () async {},
              onRefresh: () async {},
              listView: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 200,
                    color: index % 2 == 0 ? Colors.red : Colors.green,
                  );
                },
                itemCount: 15,
              ),
            ),
          )
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
          child: EmptyDataComponents(),
        ),
      ),
    );
  }
}
