import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/preferences/domain/entity/language_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';

abstract class IPreferenceRepository {
  Future<Result<ThemePreferenceEntity>> getThemePreference();
  Future<Result<LanguagePreferenceEntity>> getLanguagePreference();
  Future<Result<String>> getBaseCurrencyPreference();
  Future<Result<void>> setThemePreference(ThemePreferenceEntity themePreference);
  Future<Result<void>> setLangaugePreference(LanguagePreferenceEntity languagePreference);
  Future<Result<void>> setBaseCurrencyPreference(String baseCurrency);
}
