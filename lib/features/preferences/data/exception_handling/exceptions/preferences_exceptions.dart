import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_exceptions.freezed.dart';

@freezed
class PreferencesException with _$PreferencesException {
  @Implements(Exception)
  const factory PreferencesException.baseCurrencyFetchingException() = BaseCurrencyFetchingException;
  @Implements(Exception)
  const factory PreferencesException.languageFetchingException() = LanguageFetchingException;
  @Implements(Exception)
  const factory PreferencesException.themeFetchingException() = ThemeFetchingException;
  @Implements(Exception)
  const factory PreferencesException.baseCurrencySetException() = BaseCurrencySetException;
  @Implements(Exception)
  const factory PreferencesException.languageSetException() = LanguageSetException;
  @Implements(Exception)
  const factory PreferencesException.themeSetException() = ThemeSetException;
  @Implements(Exception)
  const factory PreferencesException.supportedCurrenciesFetchingException() = SupportedCurrenciesFetchingException;
}