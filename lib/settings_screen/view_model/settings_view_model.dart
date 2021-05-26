import 'package:coin_dino/features/preferences/data/repository/preference_repository.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';
import 'package:mobx/mobx.dart';

part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store {
  final IPreferenceRepository preferenceRepository;

  _SettingsViewModelBase({required this.preferenceRepository});


  


}


/*
Future<Result<ThemePreferenceEntity>> getThemePreference();
  Future<Result<LanguagePreferenceEntity>> getLanguagePreference();
  Future<Result<String>> getBaseCurrencyPreference();
  Future<Result<void>> setThemePreference(ThemePreferenceEntity themePreference);
  Future<Result<void>> setLangaugePreference(LanguagePreferenceEntity languagePreference);
  Future<Result<void>> setBaseCurrencyPreference(String baseCurrency);
  Future<Result<List<String>>> getAllSupportedBaseCurrencies();

*/