import 'package:coin_dino/core/localization/localization_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class LocalizationHelper {
  static var shared = LocalizationHelper._privateconstructor();
  LocalizationHelper._privateconstructor();

  Widget runAppWithEasyWidget(Widget myApp) {
    return EasyLocalization(
        child: myApp,
        fallbackLocale: LocalizationConstants.FALLBACK_LOCALE,
        supportedLocales: [
          LocalizationConstants.SUPPORTED_LOCALES_EN,
          LocalizationConstants.SUPPORTED_LOCALES_TR
        ],
        path: LocalizationConstants.LOCALIZATON_PATH);
  }
}
