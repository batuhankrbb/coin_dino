import 'package:coin_dino/core/localization/localization_helper.dart';
import 'package:coin_dino/features/alert/data/model/alert_model.dart';
import 'package:coin_dino/global/starting_files/start_app.dart';
import 'package:coin_dino/root_screen.dart';
import 'package:coin_dino/screen_alert_list/alert_list_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'features/alert/data/data_source/implementations/alert_local_data_source.dart';
import 'features/alert/data/data_source/implementations/alert_remote_data_source.dart';
import 'features/alert/data/exception_handling/exception_handler.dart';
import 'features/alert/data/repository/alert_repository.dart';
import 'features/alert/domain/entity/alert_entity.dart';
import 'features/alert/domain/repository_contract/i_alert_repository.dart';
import 'features/preferences/data/implementations/preferences_local_data_source.dart';
import 'xscreen_main/main_screen.dart';
import 'screen_alert_detail/alert_detail_screen.dart';
import 'screen_detail/coin_detail_screen.dart';
import 'screen_home/home_screen.dart';
import 'screen_in_app_purchase/inapp_purchase_screen.dart';
import 'screen_onboard/onboard_screen.dart';
import 'screen_search/search_screen.dart';
import 'screen_search/search_screen_main.dart';
import 'screen_settings/settings_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'core/hive/hive_helper.dart';
import 'core/navigation/services/navigation_service.dart';
import 'core/navigation/services/router_service.dart';
import 'global/app_settings/app_settings_viewmodel.dart';
import 'global/starting_files/injection_container.dart';
import 'global/starting_files/launch_app.dart';

void main() async {
  await startApp();
  runApp(
    LocalizationHelper.shared.runAppWithEasyWidget(
      MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  final AppSettingsViewModel appSettingsViewModel =
      getit.get<AppSettingsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          navigatorKey: NavigationService.shared.navigatorKey,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          onGenerateRoute: RouterService.generateCustomRoute,
          theme: appSettingsViewModel.themeData,
          //    builder: DevicePreview.appBuilder,
          //      locale: DevicePreview.locale(context),
          home: RootScreen(),
        );
      },
    );
  }
}
