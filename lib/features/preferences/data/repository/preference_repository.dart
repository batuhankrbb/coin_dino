
import 'package:coin_dino/features/preferences/data/contracts/i_preferences_local_data_source.dart';
import 'package:coin_dino/features/preferences/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/preferences/data/exception_handling/exceptions/preferences_exceptions.dart';
import 'package:coin_dino/features/preferences/data/implementations/preferences_local_data_source.dart';
import 'package:coin_dino/features/preferences/domain/entity/theme_preference_entity.dart';
import 'package:coin_dino/features/preferences/domain/entity/language_preference_entity.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/preferences/domain/repository_contract/i_preference_repository.dart';

class PreferenceRepository implements IPreferenceRepository {
  final IPreferencesLocalDataSource preferencesLocalDataSource;
  final PreferencesExceptionHandler exceptionHandler;

  PreferenceRepository(
      {required this.preferencesLocalDataSource,
      required this.exceptionHandler});

//TODO NULL KONTROLÜNÜ VIEWMODEL İÇERİSİNDE YAPICAZ
  @override
  Future<Result<String>> getBaseCurrencyPreference() async {
    try {
      var baseCurrencyPreference =
          await preferencesLocalDataSource.getBaseCurrencyPreference();
      return Result.success(baseCurrencyPreference);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<LanguagePreferenceEntity>> getLanguagePreference() async {
    try {
      var languagePreference =
          await preferencesLocalDataSource.getLanguagePreference();
      var entity = languagePreference.toLanguagePrerence();
      return Result.success(entity);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<ThemePreferenceEntity>> getThemePreference() async {
    try {
      var themePreference =
          await preferencesLocalDataSource.getThemePreference();
      var entity = themePreference.toThemePrerence();
      return Result.success(entity);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> setBaseCurrencyPreference(String baseCurrency) async {
    try {
      var result = await preferencesLocalDataSource
          .setBaseCurrencyPreference(baseCurrency);
      return Result.success(result);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> setLangaugePreference(
      LanguagePreferenceEntity languagePreference) async {
    try {
      var text = languagePreference.rawValue;
      var result = await preferencesLocalDataSource.setLangaugePreference(text);
      return Result.success(result);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> setThemePreference(
      ThemePreferenceEntity themePreference) async {
    try {
      var text = themePreference.rawValue;
      var result = await preferencesLocalDataSource.setThemePreference(text);
      return Result.success(result);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<List<String>>> getAllSupportedBaseCurrencies() async {
    try {
      var supportedCurrencies = await
          preferencesLocalDataSource.getAllSupportedBaseCurrencies();
      return Result.success(supportedCurrencies);
    } on PreferencesException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
