import 'package:coin_dino/features/preferences/domain/entity/language_preference_entity.dart';

import 'localization_constants.dart';
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
          LocalizationConstants.SUPPORTED_LOCALES_TR,
          LocalizationConstants.SUPPORTED_LOCALES_FR,
          LocalizationConstants.SUPPORTED_LOCALES_ES,
        ],
        path: LocalizationConstants.LOCALIZATON_PATH);
  }

  Future<void> setLocale(
      LanguagePreferenceEntity language, BuildContext context) async {
    switch (language) {
      case LanguagePreferenceEntity.turkish:
        EasyLocalization.of(context)?.setLocale(
          Locale("tr", "TR"),
        );
        break;
      case LanguagePreferenceEntity.english:
        EasyLocalization.of(context)?.setLocale(
          Locale("en", "US"),
        );
        break;
    }
  }
}
