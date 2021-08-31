import 'package:background_fetch/background_fetch.dart';
import 'package:coin_dino/core/in_app_purchase/iap_service.dart';
import 'package:flutter/services.dart';
import '../../core/background/background_helper.dart';
import '../../core/notification/notification_helper.dart';
import '../../features/alert/data/repository/alert_repository.dart';
import '../../features/alert/domain/repository_contract/i_alert_repository.dart';

import '../../core/hive/hive_helper.dart';
import '../app_settings/app_settings_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'injection_container.dart';
import 'launch_app.dart';

class AppStartConfig {
  AppStartConfig._privateConstructor();

  static var shared = AppStartConfig._privateConstructor();

  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await _setUpDeviceSettings();
    await MobileAds.instance.initialize();
    await HiveHelper.shared.setUpHive();
    setupGetIt();
    initializeIAPService();
    await launchApp(); //* sets up base options
    await NotificationHelper.shared.initializeNotification();
    await getit
        .get<AppSettingsViewModel>()
        .setUpSettings(); //* sets up theme options.
    await _setUpBackgroundFetch();
  }

  Future<void> _setUpBackgroundFetch() async {
    try {
      var alertRepository = getit.get<IAlertRepository>();
      await BackgroundHelper.shared.initializeBackground(() async {
        await alertRepository.checkAlertsForNotification();
      });
      await BackgroundHelper.shared.startBackgroundFetch();
    } catch (e) {
      print("Error in StartApp/setUpBackgroundFetch");
    }
  }

  Future<void> _setUpDeviceSettings() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  var alertRepository = getit.get<IAlertRepository>();
  if (isTimeout) {
    BackgroundFetch.finish(taskId);
    return;
  }
  await alertRepository.checkAlertsForNotification();
  BackgroundFetch.finish(taskId);
}
