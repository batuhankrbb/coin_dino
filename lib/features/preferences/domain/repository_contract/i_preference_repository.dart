import '../../../../core/result_types/result.dart';
import '../entity/language_preference_entity.dart';
import '../entity/theme_preference_entity.dart';

abstract class IPreferenceRepository {
  Future<Result<ThemePreferenceEntity>> getThemePreference();
  Future<Result<LanguagePreferenceEntity>> getLanguagePreference();
  Future<Result<String>> getBaseCurrencyPreference();
  Future<Result<void>> setThemePreference(ThemePreferenceEntity themePreference);
  Future<Result<void>> setLangaugePreference(LanguagePreferenceEntity languagePreference);
  Future<Result<void>> setBaseCurrencyPreference(String baseCurrency);
  Future<Result<List<String>>> getAllSupportedBaseCurrencies();
  Future<List<ThemePreferenceEntity>> getAllThemes();
}
