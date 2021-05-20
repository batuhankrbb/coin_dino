abstract class IPreferencesLocalDataSource{
   Future<String> getThemePreference();
  Future<String> getLanguagePreference();
  Future<String> getBaseCurrencyPreference();
  Future<void> setThemePreference(String themePreference);
  Future<void> setLangaugePreference(String languagePreference);
  Future<void> setBaseCurrencyPreference(String currencyPreference);
}