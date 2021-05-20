import 'package:coin_dino/features/preferences/data/contracts/i_preferences_local_data_source.dart';

class PreferencesLocalDataSource implements IPreferencesLocalDataSource{
  //TODO KOLAY GELSİN SERCAN ABİ. EXCEPTION KISMINI İSTERSEN EKLE YA DA İSTERSEN CATCH İÇİNDE THROW "" YAP BEN HALLEDEYİM
  @override
  Future<String> getBaseCurrencyPreference() {
    // TODO: implement getBaseCurrencyPreference
    throw UnimplementedError();
  }

  @override
  Future<String> getLanguagePreference() {
    // TODO: implement getLanguagePreference
    throw UnimplementedError();
  }

  @override
  Future<String> getThemePreference() {
    // TODO: implement getThemePreference
    throw UnimplementedError();
  }

  @override
  Future<void> setBaseCurrencyPreference(String currencyPreference) {
      // TODO: implement setBaseCurrencyPreference
      throw UnimplementedError();
    }
  
    @override
    Future<void> setLangaugePreference(String languagePreference) {
      // TODO: implement setLangaugePreference
      throw UnimplementedError();
    }
  
    @override
    Future<void> setThemePreference(String themePreference) {
    // TODO: implement setThemePreference
    throw UnimplementedError();
  }

}