import 'package:background_fetch/background_fetch.dart';
import 'package:coin_dino/core/background/background_helper.dart';
import 'package:coin_dino/features/alert/data/repository/alert_repository.dart';
import 'package:coin_dino/features/alert/domain/repository_contract/i_alert_repository.dart';

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
    await MobileAds.instance.initialize();
    await HiveHelper.shared.setUpHive();
    setupGetIt();
    await launchApp(); //* sets up base options
    await getit
        .get<AppSettingsViewModel>()
        .setUpSettings(); //* sets up theme options.
    await _setUpBackgroundFetch();
  }

  Future<void> _setUpBackgroundFetch() async {
    var alertRepository = getit.get<IAlertRepository>();
    await BackgroundHelper.shared.initializeBackground(() async{
      await alertRepository.checkAlertsForNotification();
    });
    await BackgroundHelper.shared.startBackgroundFetch();
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
