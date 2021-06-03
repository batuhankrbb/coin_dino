import 'package:auto_size_text/auto_size_text.dart';
import 'package:coin_dino/coin_detail_screen/coin_detail_screen.dart';
import 'package:coin_dino/core/navigation/services/navigation_service.dart';
import 'package:coin_dino/core/navigation/services/router_service.dart';
import 'package:coin_dino/core/utils/number_helper.dart';
import 'package:coin_dino/inapp_purchase_screen/inapp_purchase_screen.dart';
import 'package:coin_dino/search_screen/components/percentage_chip.dart';
import 'package:coin_dino/search_screen/search_screen.dart';
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
import 'settings_screen/settings_screen.dart';

void main() async {
  await HiveHelper.shared.setUpHive();
  setupGetIt();
  await launchApp();
  await getit.get<AppSettingsViewModel>().setUpSettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        navigatorKey: NavigationService.shared.navigatorKey,
        onGenerateRoute: RouterService.generateCustomRoute,
        theme: appSettingsViewModel.themeData,
        locale: DevicePreview.locale(context),
        home: SearchScreen (),
      );
    });
  }
}

//*
class HomePage extends StatelessWidget {
  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PercentageChip(
          percentage: 0.153214,
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
      theme: MaterialExtensions.lightModeTheme,
      darkTheme: MaterialExtensions.darkModeTheme,
      home: Scaffold(
        body: Center(child: OnboardScreen()),
      ),
    );
  }
}
