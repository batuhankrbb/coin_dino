import '../../core/hive/hive_helper.dart';
import '../app_settings/app_settings_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'injection_container.dart';
import 'launch_app.dart';

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
}
