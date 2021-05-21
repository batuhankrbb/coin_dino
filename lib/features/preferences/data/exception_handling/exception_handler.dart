import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/features/preferences/data/exception_handling/exceptions/preferences_exceptions.dart';

class PreferencesExceptionHandler {
  CustomFailure handleException(PreferencesException exception) {
    return exception.when(baseCurrencyFetchingException: () {
      return CustomFailure(
          message: "There is an error in BaseCurrencyFetching");
    }, languageFetchingException: () {
      return CustomFailure(message: "There is an error in LanguageFetching");
    }, themeFetchingException: () {
      return CustomFailure(message: "There is an error in LanguageFetching");
    }, baseCurrencySetException: () {
      return CustomFailure(message: "There is an error in BaseCurrencySet");
    }, languageSetException: () {
      return CustomFailure(message: "There is an error in LanguageSet");
    }, themeSetException: () {
      return CustomFailure(message: "There is an error in ThemeSet");
    },supportedCurrenciesFetchingException: (){
       return CustomFailure(message: "There is an error in SupportedCurrenciesFetching");
    });
  }
}
