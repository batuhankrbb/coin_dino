import 'package:coin_dino/features/alert/data/model/alert_model.dart';

import 'features/alert/data/data_source/implementations/alert_local_data_source.dart';
import 'features/alert/data/data_source/implementations/alert_remote_data_source.dart';
import 'features/alert/data/exception_handling/exception_handler.dart';
import 'features/alert/data/repository/alert_repository.dart';
import 'features/alert/domain/entity/alert_entity.dart';
import 'features/alert/domain/repository_contract/i_alert_repository.dart';
import 'features/preferences/data/implementations/preferences_local_data_source.dart';
import 'main_screen.dart';
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
  await HiveHelper.shared.setUpHive();
  setupGetIt();
  await launchApp(); //* sets up base options
  await getit
      .get<AppSettingsViewModel>()
      .setUpSettings(); //* sets up theme options.
  runApp(
    DevicePreview(builder: (_) => MyApp()),
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
          navigatorKey: NavigationService.shared.navigatorKey,
          onGenerateRoute: RouterService.generateCustomRoute,
          theme: appSettingsViewModel.themeData,
            builder: DevicePreview.appBuilder,
           locale: DevicePreview.locale(context),
          home: AlertDetailScreen(alertEntity: AlertEntity(coindID: "bitcoin", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", symbol: "BTC", currentPrice: 1500), isUpdate: false,),
        );
      },
    );
  }
}
